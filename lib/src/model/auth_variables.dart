import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';
import 'package:hive/hive.dart';

part 'auth_variables.g.dart';

typedef VoidCallback = void Function();

@HiveType(typeId: 0)
class AuthVariables {
  AuthVariables({this.authToken = '', this.refreshToken = ''});
  AuthVariables.withSavedCallback(
      {this.authToken = '',
      this.refreshToken = '',
      VoidCallback? savedCallback})
      : _savedCallback = savedCallback;
  @HiveField(0)
  String authToken;
  @HiveField(1)
  String refreshToken;
  VoidCallback? _savedCallback;

  void save() => (_savedCallback == null)
      ? throw FenestraAPIError(
          "AuthVariables savedCallback not does not initialize")
      : _savedCallback!();
}
