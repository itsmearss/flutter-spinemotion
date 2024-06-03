import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/pages/loginpage/login_page.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class RegisterProvider extends ChangeNotifier {
  String requestBaseUrl = ApiEndPoints.baseUrl;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  // Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void registerUser(
      {required String fullname,
      required String email,
      required String noHp,
      required String password,
      required String confirmPassword,
      BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/register";

    final body = {
      "fullname": fullname,
      "email": email,
      "no_hp": noHp,
      "password": password,
      "confirm_password": confirmPassword
    };

    print(jsonEncode(body));

    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response req = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = "Berhasil mendaftar, cek email untuk verifikasi";
        notifyListeners();
        PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
      } else {
        final res = jsonDecode(req.body);

        print(res);
        _isLoading = false;
        _resMessage = res["message"];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
