import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/startgerakan/start_gerakan.dart';
import 'package:spinemotion_app/pages/terapipage/bridge_pose.dart';
import 'package:spinemotion_app/pages/terapipage/chest_opener_stretch.dart';
import 'package:spinemotion_app/pages/terapipage/cobra_pose.dart';
import 'package:spinemotion_app/pages/terapipage/mountain_pose.dart';
import 'package:spinemotion_app/pages/terapipage/push_up_to_down_dog.dart';
import 'package:spinemotion_app/pages/terapipage/seated_wall_angels.dart';
import 'package:spinemotion_app/pages/terapipage/table_top_lift.dart';
import 'package:spinemotion_app/pages/terapipage/warrior_pose.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';

import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class DetectPage extends StatefulWidget {
  final String selectedPose;

  DetectPage({required this.selectedPose});

  @override
  _DetectPageState createState() => _DetectPageState();
}

class _DetectPageState extends State<DetectPage> {
  late IO.Socket socket;
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  Timer? _timer;
  Timer? _navigationTimer;
  Uint8List? _imageBytes;
  String poseClass = '';
  double probability = 0.0;
  bool showImage = false;
  bool isConnected = false;
  late String userId;

  String baseUrl = ApiEndPoints.baseUrl;

  int _start = 120;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    initializeCamera();
    _getUserIdAndConnect();
    startNavigationTimer();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    socket.dispose();
    _timer?.cancel();
    _controller.dispose();
    _navigationTimer?.cancel();
    super.dispose();
  }

  void startNavigationTimer() {
    _navigationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start <= 0) {
          _navigationTimer?.cancel();
          navigateToNextPage();
        } else {
          _start--;
        }
      });
    });
  }

  void navigateToNextPage() {
    if (widget.selectedPose == 'Chest-Opener-Stretch') {
      PageNavigator(ctx: context).nextPageOnly(page: ChestOpenerStretchPage());
    } else if (widget.selectedPose == 'Cobra-Pose') {
      PageNavigator(ctx: context).nextPageOnly(page: CobraPosePage());
    } else if (widget.selectedPose == 'Bridge-Pose') {
      PageNavigator(ctx: context).nextPageOnly(page: BridgePosePage());
    } else if (widget.selectedPose == 'Mountain-Pose') {
      PageNavigator(ctx: context).nextPageOnly(page: MountainPosePage());
    } else if (widget.selectedPose == 'Push-Up-to-Down-Dog') {
      PageNavigator(ctx: context).nextPageOnly(page: PushUpToDownDogPage());
    } else if (widget.selectedPose == 'Seated-Wall-Angels') {
      PageNavigator(ctx: context).nextPageOnly(page: SeatedWallAngelsPage());
    } else if (widget.selectedPose == 'Table-Top-Lift') {
      PageNavigator(ctx: context).nextPageOnly(page: TableTopLiftPage());
    } else if (widget.selectedPose == 'Warrior-Pose') {
      PageNavigator(ctx: context).nextPageOnly(page: WarriorPosePage());
    }
  }

  Future<void> _getUserIdAndConnect() async {
    final id = await DatabaseProvider().getUserId();
    print('userid  $id');
    setState(() {
      userId = id;
    });
    connectToServer();
  }

  void connectToServer() async {
    socket = IO.io(ApiEndPoints.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.on('connect', (_) {
      print('Connected to server');
      setState(() {
        isConnected = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terhubung ke server'),
        ),
      );
      startSendingImages();
    });

    socket.on('response', (data) {
      print('Received data from server: $data');
      try {
        String imageData = data['imageData'];
        String bodyLanguageClass = data['pose_class'];
        double prob = double.parse(data['prob']);

        List<int> imageBytes = base64Decode(imageData);
        setState(() {
          _imageBytes = Uint8List.fromList(imageBytes);
          poseClass = bodyLanguageClass;
          probability = prob;
          showImage = true;
        });
      } catch (e) {
        print('Error handling response: $e');
      }

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          showImage = false;
        });
      });
    });

    socket.on('disconnect', (_) {
      print('Disconnected from server');
      setState(() {
        isConnected = false;
      });
    });

    socket.connect();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    CameraDescription? frontCamera;
    for (CameraDescription camera in _cameras) {
      if (camera.lensDirection == CameraLensDirection.front) {
        frontCamera = camera;
        break;
      }
    }

    if (frontCamera != null) {
      _controller = CameraController(frontCamera, ResolutionPreset.high);
    } else {
      _controller = CameraController(_cameras[0], ResolutionPreset.high);
    }

    await _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _timer?.cancel();
        socket.dispose();
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryElement,
        body: Stack(
          children: [
            Center(
              child: isConnected
                  ? (showImage
                      ? _imageBytes != null
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: Image.memory(
                                _imageBytes!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : CircularProgressIndicator()
                      : _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: CameraPreview(_controller),
                            )
                          : CircularProgressIndicator())
                  : CircularProgressIndicator(),
            ),
            if (isConnected)
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pose: $poseClass',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Probability: ${probability.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Selected Pose: ${widget.selectedPose}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        poseClass == widget.selectedPose
                            ? 'Gerakan Sesuai'
                            : 'Gerakan Tidak Sesuai',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Positioned(
                top: 10,
                left: 10,
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/videos/${widget.selectedPose}.gif',
                      width: 150,
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Waktu Tersisa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '$_start detik',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void startSendingImages() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) async {
      if (_controller.value.isInitialized) {
        final picture = await _controller.takePicture();
        final File imageFile = File(picture.path);
        final List<int> imageBytes = await imageFile.readAsBytes();
        final String base64Image = base64Encode(imageBytes);

        socket.emit('image', {
          'image_data': base64Image,
          'userId': userId,
          'selected_pose': widget.selectedPose,
        });
      }
    });
  }
}
