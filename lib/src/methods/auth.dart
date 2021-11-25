import 'dart:convert';
import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';
import 'package:fenestra_sdk_dart/src/http_api_type.dart';
import 'package:fenestra_sdk_dart/src/middleware.dart';

class FenestraSDKAuth {
  const FenestraSDKAuth(this.address, this.__auth);
  final String address;
  final AuthVariables __auth;

  Future<Map<String, dynamic>> signUp(
    String firstName,
    String lastName,
    String login,
    String password,
    int color,
  ) async {
    var data = await middleware(
        serverAddress: address,
        methodAddress: '/auth/signUp',
        type: HttpAPIType.post,
        headers: {"Content-Type": 'application/json'},
        authVariables: __auth,
        body: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "login": login,
          "password": password,
          "color": color
        }));
    __auth.authToken = data['auth_token'];
    __auth.refreshToken = data['refresh_token'];
    return data;
  }

  Future<Map<String, dynamic>> signIn(
    String login,
    String password,
  ) async {
    var data = await middleware(
        serverAddress: address,
        type: HttpAPIType.post,
        methodAddress: '/auth/signIn',
        headers: {"Content-Type": 'application/json'},
        authVariables: __auth,
        body: jsonEncode({
          "login": login,
          "password": password,
        }));
    __auth.authToken = data['auth_token'];
    __auth.refreshToken = data['refresh_token'];
    return data;
  }

  Future<Map<String, dynamic>> reloadToken(String refreshToken) async {
    var data = await middleware(
        serverAddress: address,
        methodAddress: '/auth/reloadToken',
        type: HttpAPIType.post,
        headers: {"Content-Type": 'application/json'},
        authVariables: __auth,
        body: jsonEncode({"refresh_token": refreshToken}));
    __auth.authToken = data['auth_token'];
    __auth.refreshToken = data['refresh_token'];
    return data;
  }

  Future<bool> isCorrectLogin(String login) async {
    try {
      await middleware(
          serverAddress: address,
          type: HttpAPIType.post,
          methodAddress: '/auth/checkCorrectLogin',
          headers: {"Content-Type": 'application/json'},
          authVariables: __auth,
          body: jsonEncode({
            "login": login,
          }));
      return true;
    } catch (_) {
      return false;
    }
  }
}
