import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';
import 'package:fenestra_sdk_dart/src/methods/notify/notify.dart';

import 'methods/auth.dart';
import 'methods/user.dart';

class FenestraSDK {
  const FenestraSDK({required this.address, required this.authVariables});
  final String address;
  final AuthVariables authVariables;
  FenestraSDKAuth get auth => FenestraSDKAuth(address, authVariables);
  FenestraSDKUser get users => FenestraSDKUser(address, authVariables);
  FenestraSDKNotify get notify => FenestraSDKNotify(address, authVariables);
}
