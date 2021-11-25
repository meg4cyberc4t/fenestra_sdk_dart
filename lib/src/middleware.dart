import 'dart:convert';

import 'package:fenestra_sdk_dart/src/auth_variables.dart';
import 'package:fenestra_sdk_dart/src/error.dart';
import 'package:fenestra_sdk_dart/src/extensions.dart';
import 'package:fenestra_sdk_dart/src/http_api_type.dart';
import 'package:http/http.dart' as http;

Future<dynamic> middleware({
  required String serverAddress,
  required String methodAddress,
  HttpAPIType type = HttpAPIType.get,
  Map<String, String>? headers,
  Object? body,
  required AuthVariables authVariables,
}) async {
  Uri uri = Uri.parse(serverAddress + methodAddress);
  late http.Response data;
  switch (type) {
    case HttpAPIType.get:
      data = await http.get(uri, headers: headers);
      break;
    case HttpAPIType.post:
      data = await http.post(uri, headers: headers, body: body);
      break;
    case HttpAPIType.delete:
      data = await http.post(uri, headers: headers, body: body);
      break;
    case HttpAPIType.patch:
      data = await http.post(uri, headers: headers, body: body);
      break;
    case HttpAPIType.put:
      data = await http.put(uri, headers: headers, body: body);
      break;
  }
  if (data.statusCode == 401) {
    http.Response data = await http.post(
        Uri.parse('$serverAddress/auth/reloadToken'),
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode({"refresh_token": authVariables.refreshToken}));
    if (data.statusCode == 401) {
      throw FenestraAPIError("Unauthorization");
    }
    checkHttpStatusCode(data.statusCode);
    if (data.statusCode == 202) {
      return;
    }
    Map answer = jsonDecode(utf8.decode(data.bodyBytes));
    authVariables.authToken = answer['auth_token'];
    authVariables.refreshToken = answer['refresh_token'];
    return middleware(
        serverAddress: serverAddress,
        methodAddress: methodAddress,
        type: type,
        headers: headers,
        body: body,
        authVariables: authVariables);
  }
  checkHttpStatusCode(data.statusCode);
  return jsonDecode(utf8.decode(data.bodyBytes));
}
