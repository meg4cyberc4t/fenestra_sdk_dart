import 'extensions.dart';
import 'megasdkauth.dart';
import 'megasdkuser.dart';

class MegaSDK {
  MegaSDK([String? address]) {
    address ??= 'http://localhost:8080';
    AuthVariables __auth = AuthVariables('', '');
    auth = MegaSDKAuth(address: address, auth: __auth);
    user = MegaSDKUser(address: address, auth: __auth);
  }
  late String address;
  late MegaSDKAuth auth;
  late MegaSDKUser user;
}
