import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class PerformPage extends StatefulWidget {
  const PerformPage({Key? key}) : super(key: key);

  @override
  State<PerformPage> createState() => _PerformPageState();
}

class _PerformPageState extends State<PerformPage> {
  final String url = ApiEndPoints.baseUrl;

  String? token;

  @override
  void initState() {
    _getToken();

    super.initState();
  }

  void _getToken() async {
    final newToken = await DatabaseProvider().getToken();
    setState(() {
      token = newToken;
    });
    print(
        'Id: $token'); // Debugging: Print token untuk memastikan token sudah diambil
  }

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Performa Pengguna"),
        ),
        body: Center(
          child:
              CircularProgressIndicator(), // Tampilkan loading indicator saat menunggu id
        ),
      );
    }

    String urlEndpoint = '$url/user/perform';
    print(
        "URL: $urlEndpoint"); // Debugging: Print URL API perform (untuk memastikan URL API perform sudah benar
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              PageNavigator(ctx: context).nextPageOnly(page: ProfilePage());
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          backgroundColor: AppColors.primaryElement,
          title: const Text(
            "Performa Pengguna",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: WebUri(urlEndpoint),
            headers: {'Authorization': 'Bearer $token'} // URL API perform
            ),
      ),
    );
  }
}
