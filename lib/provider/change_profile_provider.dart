import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class ChangeProfileProvider extends ChangeNotifier {
  String requestBaseUrl = ApiEndPoints.baseUrl;
  String apiKey = ApiEndPoints.apiKey;

  // Setter
  bool _isLoading = false;
  String? _resMessage;

  bool get isLoading => _isLoading;
  String? get resMessage => _resMessage;

  void changeProfile(
      {required String name,
      required String noHP,
      BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/update-profile";

    final body = {
      "fullname": name,
      "no_hp": noHP,
    };

    final token = await DatabaseProvider().getToken();

    try {
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      };

      var request = http.MultipartRequest('PUT', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields.addAll(body);
      print(request.fields);

      var response = await request.send();
      if (response.statusCode == 200) {
        // Success
        _resMessage = "Berhasil ubah profil";
        notifyListeners();

        await Future.delayed(Duration(milliseconds: 300));
        PageNavigator(ctx: context).nextPage(page: ProfilePage());
      } else {
        // Error
        _resMessage = "Gagal ubah profil";
        notifyListeners();
      }
    } catch (e) {
      _resMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
