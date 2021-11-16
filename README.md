# megasdkdart
 The official sdk for the user-friendly API of Mega services in the Dart language.

### example:
```dart
import 'package:megasdkdart/megasdkdart.dart';

void main() async {
  // Initializing the sdk. You can work from multiple accounts,
  // then create multiple instances in different variables
  final sdk = MegaSDK();

  // Be sure to log in to the system
  await sdk.auth.signIn('login', 'password');

  // You can get information on the account using
  await sdk.users.get();
  //Or pass the person's id to it
  await sdk.users.get(1);

  // To work with notify methods, use
  await sdk.notify.notifications.create(title: 'title');
  await sdk.notify.notifications.edit(id: 1, title: '2');
  await sdk.notify.notifications.delete(1);
  await sdk.notify.folders.getAll();
  await sdk.notify.folders.get(1);

  // As well as many other methods that you need to read
  // about in the instructions of this library.
  // For a better understanding of the SDK,
  // I advise you to read the official website with API documentation.

  // Please note that all functions are asynchronous

  // And also note that some functions return values. You can get them like this
  var data = await sdk.auth.signIn('login', 'password');
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
