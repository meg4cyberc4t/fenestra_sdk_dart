# megasdkdart
 The official sdk for the user-friendly API of Mega services in the Dart language.

### Example:
```dart
import 'package:megasdkdart/megasdkdart.dart';
import 'package:megasdkdart/src/auth_variables.dart';

void main() async {
  // Initializing the sdk. You can work from multiple accounts,
  // then create multiple instances in different variables
  final MegaSDK user = MegaSDK(
    address: "http://123.456.789.101:8080",
    authVariables: AuthVariables('', ''),
  );

  // Be sure to log in to the system
  await user.auth.signIn('login', 'password');

  // You can get information on the account using
  await user.users.get();

  //Or pass the person's id to it
  await user.users.get(1);

  // To work with notify methods, use
  await user.notify.notifications.create(title: 'title');
  await user.notify.notifications.edit(id: 1, title: '2');
  await user.notify.notifications.delete(1);
  await user.notify.folders.getAll();
  await user.notify.folders.get(1);

  // As well as many other methods that you need to read
  // about in the instructions of this library.
  // For a better understanding of the SDK,
  // I advise you to read the official website with API documentation.

  // Please note that all functions are asynchronous

  // And also note that some functions return values. You can get them like this
  Map<String, dynamic> data = await user.auth.signIn('login', 'password');
  print(data);
  //   {
  //     "id": 1253705143,
  //     "auth_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTI1MzcwN...",
  //     "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTI1..."
  // }
  print(data['id']);
  // 1253705143

  // Enjoy your use :)
}

```

### Server:
https://github.com/meg4cyberc4t/mega_api/blob/main/README.md
