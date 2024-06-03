import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/pages/loginpage/login_page.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  String requestBaseUrl = ApiEndPoints.baseUrl;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  // Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void forgotPassword({required String email, BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/forgot-password";

    final body = {
      "email": email,
    };

    print(body);

    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      http.Response req = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = jsonDecode(req.body);
        _isLoading = false;
        _resMessage = "Silahkan cek email untuk mereset password";
        notifyListeners();

        PageNavigator(ctx: context).nextPageOnly(page: LoginPage());
      } else {
        final res = jsonDecode(req.body);

        _resMessage = res['message'];

        print(res);
        _isLoading = false;
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
