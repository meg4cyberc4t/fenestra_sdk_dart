import 'dart:math';

import 'package:megasdkdart/src/megasdkdart_base.dart';
import 'package:test/test.dart';

void main() async {
  group('Test sdk', () {
    final sdk = MegaSDK();
    Map data;
    test('sdk.auth.signUp', () async {
      data = await sdk.auth.signUp('first', 'last', 'login', 'password', 0);
      expect(data['id'] is int, true);
      expect(data['auth_token'] is String, true);
      expect(data['refresh_token'] is String, true);
    });

    late String refreshToken;
    test('sdk.auth.signIn', () async {
      data = await sdk.auth.signIn('login', 'password');
      refreshToken = data['refresh_token'];
      expect(data['id'] is int, true);
      expect(data['auth_token'] is String, true);
      expect(data['refresh_token'] is String, true);
    });

    test('sdk.auth.reloadToken', () async {
      data = await sdk.auth.reloadToken(refreshToken);
      expect(data['id'] is int, true);
      expect(data['auth_token'] is String, true);
      expect(data['refresh_token'] is String, true);
    });

    late int selectId;
    test('sdk.user.get', () async {
      data = await sdk.user.get();
      selectId = data['id'];
      expect(data['id'] is int, true);
      expect(data['first_name'] is String, true);
      expect(data['last_name'] is String, true);
      expect(data['login'] is String, true);
      expect(data['colleagues'] is List, true);
      expect(data['subscribers'] is List, true);
      expect(data['subscriptions'] is List, true);
      expect(data['color'] is int, true);
    });

    test('sdk.user.get(id)', () async {
      data = await sdk.user.get(selectId);
      expect(data['id'] is int, true);
      expect(data['first_name'] is String, true);
      expect(data['last_name'] is String, true);
      expect(data['login'] is String, true);
      expect(data['colleagues'] is List, true);
      expect(data['subscribers'] is List, true);
      expect(data['subscriptions'] is List, true);
      expect(data['color'] is int, true);
    });

    test('sdk.user.edit', () async {
      await sdk.user.edit(color: 1);
      data = await sdk.user.get();
      expect(data['id'] is int, true);
      expect(data['first_name'] is String, true);
      expect(data['last_name'] is String, true);
      expect(data['login'] is String, true);
      expect(data['colleagues'] is List, true);
      expect(data['subscribers'] is List, true);
      expect(data['subscriptions'] is List, true);
      expect(data['color'] is int, true);
      expect(data['color'], 1);
    });

    late int anotherUserId;
    late MegaSDK anotherSdk;
    setUp(() async {
      anotherSdk = MegaSDK();
      anotherUserId = (await anotherSdk.auth
          .signUp('firstName', 'lastName', 'login2', 'password', 0))['id'];
    });

    test('sdk.user.bond', () async {
      sdk.user.bond(anotherUserId);
      data = await sdk.user.get(anotherUserId);
      expect(data['subscribers'].contains(selectId), true);
      sdk.user.get();
      expect(data['subscriptions'].contains(anotherUserId), true);

      anotherSdk.user.bond(selectId);
      data = await sdk.user.get(anotherUserId);
      expect(data['subscribers'].contains(selectId), false);
      expect(data['subscriptions'].contains(anotherUserId), false);
      expect(data['colleagues'].contains(anotherUserId), true);

      sdk.user.get();
      expect(data['subscribers'].contains(selectId), false);
      expect(data['subscriptions'].contains(anotherUserId), false);
      expect(data['colleagues'].contains(anotherUserId), true);
    });
  });
}
//   print('sdk.user.edit');
//   data = await sdk.user.edit(color: 1);
//   print(data);

//   print('sdk.user.edit with Password');
//   data = await sdk.user.edit(password: 'new');
//   print(data);
//   sdk.auth.signIn('login', 'new');

//   MegaSDK anotherUser = MegaSDK();
//   int anotherUserId = (await anotherUser.auth
//       .signUp('firstName', 'lastName', 'login2', 'password', 0))['id'];
//   print('sdk.user.bond');
//   sdk.user.bond(anotherUserId);
//   print(sdk.user.get(anotherUserId));
// }

// 