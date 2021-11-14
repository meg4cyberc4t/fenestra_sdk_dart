import 'dart:convert';
import 'package:http/http.dart' as http;

import 'extensions.dart';

class MegaSDKAuth {
  const MegaSDKAuth({
    required this.address,
    required AuthVariables auth,
  }) : __auth = auth;
  final String address;
  final AuthVariables __auth;

  Future<Map<String, dynamic>> signUp(
    String firstName,
    String lastName,
    String login,
    String password,
    int color,
  ) async {
    http.Response data = await http.post(
      Uri.parse('$address/auth/sign-up'),
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
    __auth.authToken = output['auth_token'];
    __auth.refreshToken = output['refresh_token'];
    return output;
  }

  Future<Map<String, dynamic>> signIn(
    String login,
    String password,
  ) async {
    http.Response data = await http.post(
      Uri.parse('$address/auth/sign-in'),
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "login": login,
        "password": password,
      }),
    );
    checkHttpStatusCode(data.statusCode);
    Map<String, dynamic> output = jsonDecode(utf8.decode(data.bodyBytes));
    __auth.authToken = output['auth_token'];
    __auth.refreshToken = output['refresh_token'];
    return output;
  }

  Future<Map<String, dynamic>> reloadToken(
    String refreshToken,
  ) async {
    http.Response data = await http.post(
      Uri.parse('http://localhost:8080/auth/reload-token'),
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "refresh_token": refreshToken,
      }),
    );
    checkHttpStatusCode(data.statusCode);
    Map<String, dynamic> output = jsonDecode(utf8.decode(data.bodyBytes));
    __auth.authToken = output['auth_token'];
    __auth.refreshToken = output['refresh_token'];
    return output;
  }
}
