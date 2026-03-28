enum APIResultType { success, connectionProblem, timeout, unauthorized, error }

extension StatusX on APIResultType {
  bool get isConnectionProblem => this == APIResultType.connectionProblem;

  bool get isSuccess => this == APIResultType.success;

  bool get isError => this == APIResultType.error;

  bool get isTimeout => this == APIResultType.timeout;

  bool get isUnauthorized => this == APIResultType.unauthorized;
}
