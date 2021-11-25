import 'package:fenestra_sdk_dart/fenestra_sdk_dart.dart';
import 'package:fenestra_sdk_dart/src/methods/notify/folders.dart';
import 'package:fenestra_sdk_dart/src/methods/notify/notifications.dart';

class FenestraSDKNotify {
  const FenestraSDKNotify(this.address, this.__auth);
  final String address;
  final AuthVariables __auth;
  get folders => FenestraSDKFolders(address, __auth);
  get notifications => FenestraSDKNotifications(address, __auth);
}
