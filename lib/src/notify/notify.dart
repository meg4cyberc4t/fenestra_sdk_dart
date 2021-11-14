import 'package:megasdkdart/src/extensions.dart';
import 'package:megasdkdart/src/notify/folder.dart';

class MegaSDKNotify {
  MegaSDKNotify(this.address, this.__auth) {
    folders = MegaSDKFolders(address, __auth);
  }

  final String address;
  final AuthVariables __auth;
  late MegaSDKFolders folders;
}
