class FenestraAPIError extends Error {
  FenestraAPIError(this.message);

  final String message;

  @override
  String toString() => "FenestraAPIError: $message";
}
