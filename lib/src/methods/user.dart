import 'dart:convert';
import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';
import 'package:fenestra_sdk_dart/src/http_api_type.dart';
import 'package:fenestra_sdk_dart/src/middleware.dart';

class FenestraSDKUser {
  const FenestraSDKUser(
    this.address,
    this.__auth,
  );
  final String address;
  final AuthVariables __auth;

  Future<Map<String, dynamic>> get([int? id]) async => await middleware(
        serverAddress: address,
        methodAddress: id != null ? '/users/$id' : '/users/',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );

  Future<Map<String, dynamic>> edit({
    int? id,
    String? firstName,
    String? lastName,
    String? login,
    String? password,
    int? color,
  }) async {
    if (password != null) {
      print("Password change -> Disable all refresh tokens."
          " Don't forget to re-sign in with a new password.");
    }
    return await middleware(
        serverAddress: address,
        methodAddress: '/users/',
        type: HttpAPIType.patch,
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
        body: jsonEncode({
          "id": id,
          "first_name": firstName,
          "last_name": lastName,
          "login": login,
          "password": password,
          "color": color,
        }));
  }

  Future<void> relation(int id) async => await middleware(
        serverAddress: address,
        methodAddress: '/users/$id/relation',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );
}
