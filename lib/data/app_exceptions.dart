class AppExceptions implements Exception{
final _message;
final _prefix;
AppExceptions([this._message,this._prefix]);

String toString(){
  return '$_prefix$_message';
}
}

class FetchDataExceptions extends AppExceptions{
  FetchDataExceptions([String? message]):super(message,'Error During Communication');
}

class BadRequestException extends AppExceptions{
  BadRequestException([String? message]):super(message,'Invalid Request');
}

class UnAuthorisedException extends AppExceptions{
  UnAuthorisedException([String? message]):super(message,'UnAuthorized Request');
}

class InValidInputException extends AppExceptions{
  InValidInputException([String? message]):super(message,'Invalid Input');
}