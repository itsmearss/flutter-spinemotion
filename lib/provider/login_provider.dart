import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class LoginProvider extends ChangeNotifier {
  String requestBaseUrl = ApiEndPoints.baseUrl;
  String apiKey = ApiEndPoints.apiKey;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'openid',
      'profile',
    ],
  );

  // Setter
  GoogleSignInAccount? _user;
  bool _isLoading = false;
  String _resMessage = '';

  // Getter
  GoogleSignInAccount get user => _user!;
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void loginUser(
      {required String email,
      required String password,
      BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/auth/login";

    String credentials = "$email:$password";
    List<int> bytes = utf8.encode(credentials);
    String base64Credentials = base64Encode(bytes);

    final body = {
      "email": email,
      "password": password,
    };

    print(body);

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'Authorization': 'Basic $base64Credentials'
      };

      http.Response req = await http.post(
        Uri.parse(url),
        headers: headers,
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = jsonDecode(req.body);
        _isLoading = false;
        _resMessage = "Berhasil masuk";
        notifyListeners();

        // Save users data and then navigate to homepage
        final userId = res["user"]["id"];
        final token = res["token"];
        DatabaseProvider().saveUserId(userId.toString());
        DatabaseProvider().saveToken(token);
        print(token);
        print(userId);
        await Future.delayed(Duration(milliseconds: 300));
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
      _resMessage = "Coba lagi";
      notifyListeners();
    }
  }

  Future<void> googleLogin() async {
    try {
      _isLoading = true;
      notifyListeners();

      try {
        var account = await googleSignIn.signIn();
      } catch (error) {
        print(error);
      }

      var account = await googleSignIn.signIn();
      var authentication = await account?.authentication;

      // We will use this token ID for authentication on the backend side.
      var tokenId = authentication?.idToken;
      print(tokenId);
      print(account?.displayName);
      // if (googleUser == null) {
      //   print('Gagal masuk');
      //   return;
      // }
      // print('Proses');
      // _user = googleUser;

      // final googleAuth = await googleUser.authentication;
      // print('token');
      // print(googleAuth.idToken);

      // final response = await http.post(
      //   Uri.parse('$requestBaseUrl/auth/google-login'),
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'x-api-key': apiKey,
      //   },
      //   body: jsonEncode({
      //     'idToken': googleAuth.idToken,
      //   }),
      // );

      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   final res = jsonDecode(response.body);

      //   _isLoading = false;
      //   _resMessage = "Berhasil masuk";
      //   notifyListeners();

      //   final userId = res["user"]["id"];
      //   final token = res["token"];
      //   DatabaseProvider().saveUserId(userId.toString());
      //   DatabaseProvider().saveToken(token);
      //   print(token);
      //   print(userId);
      // } else {
      //   final res = jsonDecode(response.body);
      //   _resMessage = res['message'];
      //   _isLoading = false;
      //   notifyListeners();
      // }

      // notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
