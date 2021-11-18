import 'package:megasdkdart/src/extensions.dart';
import 'package:megasdkdart/src/notify/folders.dart';
import 'package:megasdkdart/src/notify/notifications.dart';

class MegaSDKNotify {
  const MegaSDKNotify(this.__auth);
  final AuthVariables __auth;
  get folders => MegaSDKFolders(__auth);
  get notifications => MegaSDKNotifications(__auth);
}
