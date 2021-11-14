import 'package:megasdkdart/src/notify/notify.dart';

import 'extensions.dart';
import 'auth.dart';
import 'user.dart';

class MegaSDK {
  MegaSDK([String? address]) {
    address ??= 'http://localhost:8080';
    AuthVariables __auth = AuthVariables('', '');
    auth = MegaSDKAuth(address, __auth);
    users = MegaSDKUser(address, __auth);
    notify = MegaSDKNotify(address, __auth);
  }
  late String address;
  late MegaSDKAuth auth;
  late MegaSDKUser users;
  late MegaSDKNotify notify;
}
