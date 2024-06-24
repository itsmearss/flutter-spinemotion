import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spinemotion_app/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {
    fetchProfile();
  }
  final _url = ApiEndPoints.baseUrl;
  final apiKey = ApiEndPoints.apiKey;

  ProfileModel? _profile;
  bool _isLoading = false;
  String? _resMessage;

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get resMessage => _resMessage;

  Future<void> fetchProfile() async {
    _isLoading = true;
    _resMessage = null;
    notifyListeners();

    final token = await DatabaseProvider().getToken();
    print(token);
    String url = "$_url/user/profile";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        // print(response.body);
        _profile = profileModelFromJson(response.body);
        print(_profile!);
        notifyListeners();
      } else {
        _resMessage = 'Failed to load profile';
        notifyListeners();
      }
    } catch (e) {
      _resMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
