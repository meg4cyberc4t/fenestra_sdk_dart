import 'dart:convert';

import 'package:megasdkdart/src/extensions.dart';
import 'package:http/http.dart' as http;

class MegaSDKFolders {
  const MegaSDKFolders(this.address, this.__auth);
  final AuthVariables __auth;
  final String address;

  Future<Map<String, dynamic>> get(int id) async {
    http.Response data = await http.get(
      Uri.parse('$address/notify/folders/$id'),
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
      Uri.parse('$address/notify/folders/'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
    );
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<Map<String, dynamic>> create(
      {required String title, String? description, int priority = 0}) async {
    http.Response data = await http.post(
      Uri.parse('$address/notify/folders/'),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": __auth.authToken,
      },
      body: jsonEncode(
        {"title": title, "description": description, "priority": priority},
      ),
    );
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<void> delete(int id) async {
    http.Response data = await http.delete(
      Uri.parse('$address/notify/folders/$id'),
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
    int? priority,
  }) async {
    http.Response data =
        await http.patch(Uri.parse('$address/notify/folders/$id'),
            headers: {
              "Content-Type": 'application/json',
              "Authorization": __auth.authToken,
            },
            body: jsonEncode({
              "title": title,
              "description": description,
              "priority": priority,
            }));
    checkHttpStatusCode(data.statusCode);
    return jsonDecode(utf8.decode(data.bodyBytes));
  }

  Future<void> invite({
    required int folderId,
    required int inviteUserId,
  }) async {
    http.Response data =
        await http.post(Uri.parse('$address/notify/folders/$folderId/invite'),
            headers: {
              "Content-Type": 'application/json',
              "Authorization": __auth.authToken,
            },
            body: jsonEncode({
              "id": inviteUserId,
            }));
    checkHttpStatusCode(data.statusCode);
  }

  Future<void> exclude({
    required int folderId,
    required int excludeUserId,
  }) async {
    http.Response data =
        await http.post(Uri.parse('$address/notify/folders/$folderId/exclude'),
            headers: {
              "Content-Type": 'application/json',
              "Authorization": __auth.authToken,
            },
            body: jsonEncode({
              "id": excludeUserId,
            }));
    checkHttpStatusCode(data.statusCode);
  }
}
