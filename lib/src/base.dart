import 'package:megasdkdart/src/auth_variables.dart';
import 'package:megasdkdart/src/notify/notify.dart';

import 'auth.dart';
import 'user.dart';

class MegaSDK {
  //  "http://185.12.95.163";
  const MegaSDK({required this.address, required this.authVariables});
  final String address;
  final AuthVariables authVariables;
  MegaSDKAuth get auth => MegaSDKAuth(address, authVariables);
  MegaSDKUser get users => MegaSDKUser(address, authVariables);
  MegaSDKNotify get notify => MegaSDKNotify(address, authVariables);
}
