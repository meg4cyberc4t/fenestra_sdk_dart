import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:megasdkdart/src/auth_variables.dart';

import 'extensions.dart';

class MegaSDKUser {
  const MegaSDKUser(
    this.address,
    this.__auth,
  );
  final String address;
  final AuthVariables __auth;

  Future<Map<String, dynamic>> get([int? id]) async {
    http.Response data = await http.get(
      Uri.parse(id != null ? '$address/users/$id' : '$address/users/'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
    );
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<Map<String, dynamic>> edit({
    int? id,
    String? firstName,
    String? lastName,
    String? login,
    String? password,
    int? color,
  }) async {
    http.Response data = await http.patch(Uri.parse('$address/users/'),
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        body: jsonEncode({
          "id": id,
          "first_name": firstName,
          "last_name": lastName,
          "login": login,
          "password": password,
          "color": color,
        }));
    checkHttpStatusCode(data.statusCode);
    if (password != null) {
      print("Password change -> Disable all refresh tokens."
          " Don't forget to re-sign in with a new password.");
    }
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<void> bond(int id) async {
    http.Response data = await http.get(
      Uri.parse('$address/users/$id/bond'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
    );
    checkHttpStatusCode(data.statusCode);
    return;
  }
}
