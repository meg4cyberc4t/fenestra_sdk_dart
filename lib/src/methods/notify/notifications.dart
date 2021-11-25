import 'dart:convert';

import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';
import 'package:fenestra_sdk_dart/src/http_api_type.dart';
import 'package:fenestra_sdk_dart/src/middleware.dart';

class FenestraSDKNotifications {
  const FenestraSDKNotifications(this.address, this.__auth);
  final AuthVariables __auth;
  final String address;

  Future<Map<String, dynamic>> get(int id) async => await middleware(
        serverAddress: address,
        methodAddress: '/notify/notifications/$id',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );

  Future<List> getByFolder(int folderId) async => await middleware(
        serverAddress: address,
        methodAddress: '/notify/notifications/byFolder/$folderId',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );

  Future<List> getAll() async => await middleware(
        serverAddress: address,
        methodAddress: '/notify/notifications/',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
      );

  Future<Map<String, dynamic>> create({
    required String title,
    String? description,
    int? deadline,
    int? repeat,
    int? folder,
  }) async =>
      await middleware(
        serverAddress: address,
        type: HttpAPIType.post,
        methodAddress: '/notify/notifications/',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
        body: jsonEncode(
          {
            "title": title,
            "description": description,
            "deadline": deadline,
            "repeat": repeat,
            "folder": folder,
          },
        ),
      );

  Future<void> delete(int id) async => await middleware(
        serverAddress: address,
        type: HttpAPIType.delete,
        methodAddress: '/notify/notifications/$id',
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
    int? deadline,
    int? repeat,
    int? folder,
  }) async =>
      await middleware(
        serverAddress: address,
        type: HttpAPIType.patch,
        methodAddress: '/notify/notifications/$id',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        authVariables: __auth,
        body: jsonEncode({
          "title": title,
          "description": description,
          "deadline": deadline,
          "repeat": repeat,
          "folder": folder,
        }),
      );

  Future<void> relation({
    required int notificationId,
    required int inviteUserId,
  }) async {
    await middleware(
      serverAddress: address,
      type: HttpAPIType.get,
      methodAddress: '/notify/notifications/$notificationId/relation',
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
      authVariables: __auth,
      body: jsonEncode({"id": inviteUserId}),
    );
  }
}
