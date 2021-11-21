import 'package:megasdkdart/src/auth_variables.dart';
import 'package:megasdkdart/src/notify/folders.dart';
import 'package:megasdkdart/src/notify/notifications.dart';

class MegaSDKNotify {
  const MegaSDKNotify(this.address, this.__auth);
  final String address;
  final AuthVariables __auth;
  get folders => MegaSDKFolders(address, __auth);
  get notifications => MegaSDKNotifications(address, __auth);
}
