void checkHttpStatusCode(int statusCode) {
  switch (statusCode) {
    case 200:
      return;
    case 201:
      return;
    case 401:
      throw AssertionError('Authorization failed.');
    case 403:
      throw AssertionError(
          'The method is not implemented. Hint: check if you are doing everything correctly...');
    case 404:
      throw AssertionError("Not found method!");
    case 422:
      throw AssertionError('The instance already exists.');
    default:
      throw AssertionError('Unexpected error code: $statusCode.');
  }
}
