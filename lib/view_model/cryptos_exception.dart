class CryptosException implements Exception {
  final _message;
  final _prefix;

  CryptosException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CryptosException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CryptosException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CryptosException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CryptosException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}