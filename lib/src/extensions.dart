void checkHttpStatusCode(int statusCode) {
  switch (statusCode) {
    case 401:
      throw AssertionError('Authorization failed.');
    case 422:
      throw AssertionError('The instance already exists.');
    case 403:
      throw AssertionError(
          'The method is not implemented. Hint: check if you are doing everything correctly...');
    case 200:
      return;
    case 201:
      return;
    default:
      throw AssertionError('Unexpected error code: $statusCode.');
  }
}
