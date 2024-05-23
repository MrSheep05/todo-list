enum AuthExceptionStatus {
  PermissionDenied(["PERMISSION_DENIED", "permission-denied"]),
  WrongPassword(['wrong-password']),
  UserNotFound(['user-not-found']),
  BlockingFunction(['BLOCKING_FUNCTION_ERROR_RESPONSE', "blocking-cloud-function-returned-error"]),
  NetworkError(['network-request-failed']),
  TooManyRequests(['too-many-requests']),
  InvalidCredential(['invalid-credential']),
  Undefined([]);

  const AuthExceptionStatus(this.types);
  static AuthExceptionStatus getStatus(String? statusError) => AuthExceptionStatus.values
      .firstWhere((element) => element.types.contains(statusError), orElse: () => AuthExceptionStatus.Undefined);
  final List<String?> types;

  String get message => switch (this) {
        AuthExceptionStatus.PermissionDenied => "Brak permisji",
        AuthExceptionStatus.WrongPassword ||
        AuthExceptionStatus.UserNotFound ||
        AuthExceptionStatus.InvalidCredential =>
          "Złe hasło lub login",
        AuthExceptionStatus.TooManyRequests => "Przekroczono limit prób logowania. Spróbuj później",
        _ => "Natrafiono na błąd"
      };
}
