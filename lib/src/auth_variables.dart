import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';

typedef VoidCallback = void Function();

class AuthVariables {
  AuthVariables({this.authToken = '', this.refreshToken = ''});
  AuthVariables.withSavedCallback(
      {this.authToken = '',
      this.refreshToken = '',
      VoidCallback? savedCallback})
      : _savedCallback = savedCallback;
  String authToken;
  String refreshToken;
  VoidCallback? _savedCallback;

  void save() => (_savedCallback == null)
      ? throw FenestraAPIError(
          "AuthVariables savedCallback not does not initialize")
      : _savedCallback!();
}
