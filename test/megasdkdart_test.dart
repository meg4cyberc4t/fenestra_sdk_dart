import 'package:megasdkdart/src/base.dart';
import 'package:test/test.dart';

void main() async {
  group('Test ->', () {
    final sdk = MegaSDK();
    Map data;
    late String refreshToken;

    late int anotherUserId;
    late MegaSDK anotherSdk = MegaSDK();

    test('sdk.auth.signUp', () async {
      data = await sdk.auth.signUp('first', 'last', 'login', 'password', 0);
      expect(data['id'] is int, true);
      expect(data['auth_token'] is String, true);
      expect(data['refresh_token'] is String, true);

      anotherUserId = (await anotherSdk.auth
          .signUp('firstName', 'lastName', 'login2', 'password', 0))['id'];
    });

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
    test('sdk.users.get', () async {
      data = await sdk.users.get();
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

    test('sdk.users.get(id)', () async {
      data = await sdk.users.get(selectId);
      expect(data['id'] is int, true);
      expect(data['first_name'] is String, true);
      expect(data['last_name'] is String, true);
      expect(data['login'] is String, true);
      expect(data['colleagues'] is List, true);
      expect(data['subscribers'] is List, true);
      expect(data['subscriptions'] is List, true);
      expect(data['color'] is int, true);
    });

    test('sdk.users.edit', () async {
      await sdk.users.edit(color: 1);
      data = await sdk.users.get();
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

    test('sdk.users.bond', () async {
      await sdk.users.bond(anotherUserId);
      data = await sdk.users.get();
      expect(data['subscriptions'].contains(anotherUserId), true);
      data = await sdk.users.get(anotherUserId);
      expect(data['subscribers'].contains(selectId), true);

      await anotherSdk.users.bond(selectId);
      data = await sdk.users.get(anotherUserId);
      expect(data['subscribers'].contains(selectId), false);
      expect(data['subscriptions'].contains(anotherUserId), false);
      expect(data['colleagues'].contains(selectId), true);

      data = await sdk.users.get();
      expect(data['subscribers'].contains(selectId), false);
      expect(data['subscriptions'].contains(anotherUserId), false);
      expect(data['colleagues'].contains(anotherUserId), true);
    });

    late int folderId;
    test('sdk.notify.folders.create', () async {
      data = await sdk.notify.folders.create(title: 'test');
      expect(data['id'] is int, true);
      folderId = data['id'];
    });

    test('sdk.notify.folders.get', () async {
      data = await sdk.notify.folders.get(folderId);
      expect(data['id'] is int, true);
      expect(data['owner'] is int, true);
      expect(data['title'] is String, true);
      if (data['description'] != null) {
        expect(data['description'] is String, true);
      }
      expect(data['participants'] is List, true);
      expect(data['priority'] is int, true);
    });

    test('sdk.notify.folders.delete', () async {
      await sdk.notify.folders.delete(folderId);
    });

    test('sdk.notify.folders.getAll', () async {
      var listData = await sdk.notify.folders.getAll();
      expect(listData.isEmpty, true);
    });

    test('sdk.notify.folders.edit', () async {
      data =
          await sdk.notify.folders.create(title: 'title', description: 'desc');
      await sdk.notify.folders.edit(id: data['id'], title: 'title1');
      folderId = data['id'];
      data = await sdk.notify.folders.get(data['id']);
      expect(data['description'], 'desc');
      expect(data['title'], 'title1');
    });

    test('sdk.notify.folders.invite', () async {
      await sdk.notify.folders
          .invite(folderId: folderId, inviteUserId: anotherUserId);
      expect((await anotherSdk.notify.folders.getAll()).isNotEmpty, true);
    });

    test('sdk.notify.folders.exclude', () async {
      await sdk.notify.folders
          .exclude(folderId: folderId, excludeUserId: anotherUserId);
      expect((await anotherSdk.notify.folders.getAll()).isEmpty, true);
    });
  });
}
