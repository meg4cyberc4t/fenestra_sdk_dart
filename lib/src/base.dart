import 'package:megasdkdart/src/notify/notify.dart';

import 'extensions.dart';
import 'auth.dart';
import 'user.dart';

class MegaSDK {
  const MegaSDK();
  static const address = "http://185.12.95.163";
  static AuthVariables authVariables = AuthVariables('', '');
  MegaSDKAuth get auth => MegaSDKAuth(address, authVariables);
  MegaSDKUser get users => MegaSDKUser(address, authVariables);
  MegaSDKNotify get notify => MegaSDKNotify(address, authVariables);
}
