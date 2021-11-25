class FenestraAPIError extends Error {
  FenestraAPIError(this.message);

  final String message;

  @override
  String toString() => "Assertion failed";
}
