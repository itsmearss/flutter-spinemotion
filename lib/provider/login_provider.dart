import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class LoginProvider extends ChangeNotifier {
  String requestBaseUrl = ApiEndPoints.baseUrl;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  // Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void loginUser(
      {required String email,
      required String password,
      BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/login";

    final body = {
      "email": email,
      "password": password,
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
        _resMessage = "Login successfull";
        notifyListeners();

        // Save users data and then navigate to homepage
        final userId = res["user"]["id"];
        final token = res["token"];
        DatabaseProvider().saveUserId(userId.toString());
        DatabaseProvider().saveToken(token);
        print(token);
        print(userId);
        await Future.delayed(Duration(milliseconds: 500));
        PageNavigator(ctx: context).nextPage(page: HomePage());
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
