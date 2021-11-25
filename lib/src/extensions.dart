import 'package:fenestra_sdk_dart/src/error.dart';

void checkHttpStatusCode(int statusCode) {
  switch (statusCode) {
    case 200:
      return;
    case 201:
      return;
    case 401:
      throw FenestraAPIError('Authorization failed');
    case 403:
      throw FenestraAPIError('Incorrect values');
    case 404:
      throw FenestraAPIError('Not found method');
    case 422:
      throw FenestraAPIError('The instance already exists');
    default:
      throw FenestraAPIError('Unexpected error code: $statusCode');
  }
}
