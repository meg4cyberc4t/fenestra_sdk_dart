import 'dart:convert';
import 'package:http/http.dart' as http;

import 'extensions.dart';

class MegaSDKAuth {
  const MegaSDKAuth(this.address, this.auth);
  final String address;
  final AuthVariables auth;

  Future<Map<String, dynamic>> signUp(
    String firstName,
    String lastName,
    String login,
    String password,
    int color,
  ) async {
    http.Response data = await http.post(
      Uri.parse('$address/auth/signUp'),
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "first_name": firstName,
        "last_name": lastName,
        "login": login,
        "password": password,
        "color": color
      }),
    );
    checkHttpStatusCode(data.statusCode);
    Map<String, dynamic> output = jsonDecode(utf8.decode(data.bodyBytes));
    auth.authToken = output['auth_token'];
    auth.refreshToken = output['refresh_token'];
    return output;
  }

  Future<Map<String, dynamic>> signIn(
    String login,
    String password,
  ) async {
    http.Response data = await http.post(
      Uri.parse('$address/auth/signIn'),
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "login": login,
        "password": password,
      }),
    );
    checkHttpStatusCode(data.statusCode);
    Map<String, dynamic> output = jsonDecode(utf8.decode(data.bodyBytes));
    auth.authToken = output['auth_token'];
    auth.refreshToken = output['refresh_token'];
    return output;
  }

  Future<Map<String, dynamic>> reloadToken(
    String refreshToken,
  ) async {
    http.Response data = await http.post(
      Uri.parse('$address/auth/reloadToken'),
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "refresh_token": refreshToken,
      }),
    );
    checkHttpStatusCode(data.statusCode);
    Map<String, dynamic> output = jsonDecode(utf8.decode(data.bodyBytes));
    auth.authToken = output['auth_token'];
    auth.refreshToken = output['refresh_token'];
    return output;
  }

  Future<bool> isCorrectLogin(
    String login,
  ) async {
    http.Response data = await http.post(
      Uri.parse('$address/auth/checkUniqueLogin'),
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "login": login,
      }),
    );
    return data.statusCode == 202;
  }

  Future<int> isCorrectLoginWithStatusCode(
    String login,
  ) async {
    http.Response data = await http.post(
      Uri.parse('$address/auth/checkCorrectLogin'),
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "login": login,
      }),
    );
    return data.statusCode;
  }
}
