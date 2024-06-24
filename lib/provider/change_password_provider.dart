import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ChangePasswordProvider extends ChangeNotifier {
  String requestBaseUrl = ApiEndPoints.baseUrl;
  String apiKey = ApiEndPoints.apiKey;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  // Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void requestChangePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword,
      BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/change-password";

    final body = {
      "oldPassword": oldPassword,
      "password": newPassword,
      "confirmPassword": confirmPassword,
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
        _resMessage = 'Password berhasil diubah, silahkan login kembail';
        notifyListeners();

        await Future.delayed(const Duration(milliseconds: 300));
        DatabaseProvider().logOut(context!);
      } else {
        _isLoading = false;
        _resMessage = 'Password gagal diubah';
        notifyListeners();
      }
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Password gagal diubah';
      notifyListeners();
    }
  }
}
