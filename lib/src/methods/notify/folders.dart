import 'dart:convert';

import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';
import 'package:fenestra_sdk_dart/src/http_api_type.dart';
import 'package:fenestra_sdk_dart/src/middleware.dart';

class FenestraSDKFolders {
  const FenestraSDKFolders(this.address, this.__auth);
  final AuthVariables __auth;
  final String address;

  Future<Map<String, dynamic>> get(int id) async => await middleware(
        serverAddress: address,
        type: HttpAPIType.get,
        methodAddress: '/notify/folders/$id',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );

  Future<List> getAll() async => await middleware(
        serverAddress: address,
        type: HttpAPIType.get,
        methodAddress: '/notify/folders/',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );

  Future<Map<String, dynamic>> create(
          {required String title,
          String? description,
          int priority = 0}) async =>
      await middleware(
        serverAddress: address,
        type: HttpAPIType.post,
        methodAddress: '/notify/folders/',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        body: jsonEncode(
          {
            "title": title,
            "description": description,
            "priority": priority,
          },
        ),
        authVariables: __auth,
      );

  Future<void> delete(int id) async => await middleware(
        serverAddress: address,
        type: HttpAPIType.delete,
        methodAddress: '/notify/folders/$id',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );

  Future<Map<String, dynamic>> edit({
    required int id,
    String? title,
    String? description,
    int? priority,
  }) async =>
      await middleware(
          serverAddress: address,
          type: HttpAPIType.patch,
          methodAddress: '/notify/folders/$id',
          headers: {
            "Content-Type": 'application/json',
            "Authorization": __auth.authToken,
          },
          authVariables: __auth,
          body: jsonEncode({
            "title": title,
            "description": description,
            "priority": priority,
          }));

  Future<void> relation({
    required int folderId,
    required int userId,
  }) async =>
      await middleware(
          serverAddress: address,
          type: HttpAPIType.post,
          methodAddress: '/notify/folders/$folderId/relation',
          headers: {
            "Content-Type": 'application/json',
            "Authorization": __auth.authToken,
          },
          authVariables: __auth,
          body: jsonEncode({
            "id": userId,
          }));
}
