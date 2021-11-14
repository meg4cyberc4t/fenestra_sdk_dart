import 'package:megasdkdart/src/extensions.dart';
import 'package:megasdkdart/src/notify/folders.dart';
import 'package:megasdkdart/src/notify/notifications.dart';

class MegaSDKNotify {
  MegaSDKNotify(this.address, this.__auth) {
    folders = MegaSDKFolders(address, __auth);
    notifications = MegaSDKNotifications(address, __auth);
  }

  final String address;
  final AuthVariables __auth;
  late MegaSDKFolders folders;
  late MegaSDKNotifications notifications;
}
