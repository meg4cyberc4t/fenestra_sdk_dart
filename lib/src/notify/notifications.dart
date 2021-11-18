import 'dart:convert';

import 'package:megasdkdart/src/extensions.dart';
import 'package:http/http.dart' as http;

class MegaSDKNotifications {
  MegaSDKNotifications(this.address, this.__auth);
  final AuthVariables __auth;
  final String address;

  Future<Map<String, dynamic>> get(int id) async {
    http.Response data = await http.get(
      Uri.parse('$address/notify/notifications/$id'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
    );
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<List> getByFolder(int folderId) async {
    http.Response data = await http.get(
      Uri.parse('$address/notify/notifications/byFolder/$folderId'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
    );
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<List> getAll() async {
    http.Response data = await http.get(
      Uri.parse('$address/notify/notifications/'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
    );
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<Map<String, dynamic>> create({
    required String title,
    String? description,
    int? deadline,
    int? repeat,
    int? folder,
  }) async {
    http.Response data = await http.post(
      Uri.parse('$address/notify/notifications/'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
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
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<void> delete(int id) async {
    http.Response data = await http.delete(
      Uri.parse('$address/notify/notifications/$id'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
    );
    checkHttpStatusCode(data.statusCode);
    return;
  }

  Future<Map<String, dynamic>> edit({
    required int id,
    String? title,
    String? description,
    int? deadline,
    int? repeat,
    int? folder,
  }) async {
    http.Response data =
        await http.patch(Uri.parse('$address/notify/notifications/$id'),
            headers: {
              "Content-Type": 'application/json',
              "Authorization": __auth.authToken,
            },
            body: jsonEncode({
              "title": title,
              "description": description,
              "deadline": deadline,
              "repeat": repeat,
              "folder": folder,
            }));
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<void> invite({
    required int notificationId,
    required int inviteUserId,
  }) async {
    http.Response data = await http.post(
        Uri.parse('$address/notify/notifications/$notificationId/invite'),
        headers: {
          "Content-Type": 'application/json',
          "Authorization": __auth.authToken,
        },
        body: jsonEncode({
          "id": inviteUserId,
        }));
    checkHttpStatusCode(data.statusCode);
  }
}
