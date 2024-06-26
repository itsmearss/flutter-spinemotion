import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/startgerakan/start_gerakan.dart';
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
  late Timer _timer;
  late Timer? _navigationTimer;
  late Timer? _countdownTimer;
  Uint8List? _imageBytes;
  String poseClass = '';
  double probability = 0.0;
  bool showImage = false;
  bool isConnected = false; // Tambahkan variabel ini
  late String userId;

  String baseUrl = ApiEndPoints.baseUrl;

  int _start = 120;
  int _countdownStart = 5; // Durasi countdown sebelum navigation timer

  @override
  void initState() {
    super.initState();
    // Mengunci orientasi ke landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    initializeCamera();
    _getUserIdAndConnect();
    // startNavigationTimer();
    startCountdown();
  }

  @override
  void dispose() {
    // Mengembalikan orientasi ke default (mengizinkan semua orientasi)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    socket.dispose();
    _timer.cancel();
    _controller.dispose();
    _navigationTimer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownStart <= 0) {
          _countdownTimer?.cancel();
          startNavigationTimer();
        } else {
          _countdownStart--;
        }
      });
    });
  }

  void startNavigationTimer() {
    _navigationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start <= 0) {
          _navigationTimer?.cancel();
          // Navigate to another page when the timer ends
          PageNavigator(ctx: context).nextPageOnly(page: ExerciseDetailsPage());
        } else {
          _start--;
        }
      });
    });
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
    // Ganti 'http://your-flask-server-url' dengan URL server Flask Anda
    socket = IO.io(ApiEndPoints.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.on('connect', (_) {
      print('Connected to server');
      setState(() {
        isConnected = true;
      });
      // Tampilkan Snackbar saat terhubung ke server
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terhubung ke Socket.IO server'),
        ),
      );
      startSendingImages();
    });

    socket.on('response', (data) {
      // Terima respons JSON dan ekstrak data gambar, kelas pose, dan probabilitas
      print('Received data from server: $data');

      try {
        String imageData = data['imageData'];
        String bodyLanguageClass = data['pose_class'];
        double prob = double.parse(data['prob']);

        // Konversi data gambar dari base64 ke bytes
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

      // Setelah 2 detik, kembali ke tampilan kamera
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          showImage = false;
        });
      });
    });

    socket.connect();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.high);
    await _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Menghentikan pengiriman gambar dan kembali ke halaman sebelumnya
        _timer.cancel();
        socket.dispose();
        Navigator.of(context).pop();
        return false; // Mengindikasikan bahwa kita telah menangani tombol kembali
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
                  : CircularProgressIndicator(), // Tampilkan loading saat belum terhubung
            ),
            if (isConnected && _countdownStart > 0)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Countdown: $_countdownStart detik',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (isConnected && _countdownStart <= 0)
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
                child: Row(
                  children: [
                    Image.asset('assets/videos/Seated-Wall-Angels.gif',
                        height: 120),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Waktu Tersisa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$_start detik',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
    // Timer untuk mengambil dan mengirim gambar setiap 3 detik
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) async {
      if (_controller.value.isInitialized) {
        // Ambil foto dari kamera
        final picture = await _controller.takePicture();
        // Ambil file foto
        final File imageFile = File(picture.path);
        // Baca file gambar sebagai byte
        final List<int> imageBytes = await imageFile.readAsBytes();
        // Encode bytes ke base64
        final String base64Image = base64Encode(imageBytes);

        // Kirim gambar ke server menggunakan Socket.IO
        socket.emit('image', {
          'image_data': base64Image,
          'userId': userId,
          'selected_pose': widget.selectedPose,
        });
      }
    });
  }
}
