import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spinemotion_app/pages/profilepage/otp_page.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/utils/routers.dart';

class ChangeEmailProvider extends ChangeNotifier {
  // Add your provider logic here
  // Example: increment() => notifyListeners();

  String requestBaseUrl = ApiEndPoints.baseUrl;
  String apiKey = ApiEndPoints.apiKey;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  // Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void requestChangeEmail({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/request-change-email";

    final body = {
      "new_email": email,
      "password": password,
    };

    final token = await DatabaseProvider().getToken();

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      http.Response req = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = 'Silahkan cek email anda untuk melihat kode OTP';
        notifyListeners();

        await Future.delayed(const Duration(milliseconds: 300));
        PageNavigator(ctx: context).nextPage(page: const otpPage());
      } else {
        final res = jsonDecode(req.body);
        _isLoading = false;
        _resMessage = res['message'];
        notifyListeners();
      }
    } catch (e) {
      _isLoading = false;
      _resMessage = e.toString();
      notifyListeners();
    }
  }

  void changeEmail({
    required String otp,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/verify-otp";

    final body = {
      "otp": otp,
    };

    final token = await DatabaseProvider().getToken();

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      http.Response req = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = 'Email berhasil diubah';
        notifyListeners();

        await Future.delayed(Duration(milliseconds: 300));
        DatabaseProvider().logOut(context!);
      } else {
        final res = jsonDecode(req.body);
        _isLoading = false;
        _resMessage = res['message'];
        notifyListeners();
      }
    } catch (e) {
      _isLoading = false;
      _resMessage = e.toString();
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
