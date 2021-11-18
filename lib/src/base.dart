import 'package:megasdkdart/src/notify/notify.dart';

import 'extensions.dart';
import 'auth.dart';
import 'user.dart';

class MegaSDK {
  const MegaSDK();
  static const address = "";
  static const AuthVariables authVariables = AuthVariables('', '');
  MegaSDKAuth get auth => const MegaSDKAuth('123', authVariables);
  MegaSDKUser get users => const MegaSDKUser('123', authVariables);
  MegaSDKNotify get notify => const MegaSDKNotify('123', authVariables);
}
