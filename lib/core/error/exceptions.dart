import 'package:clementoni/core/error/failures.dart';

class ServerException implements Failure {
  final String message;

  ServerException({this.message = 'Something went wrong on the server :('});

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

class LocalException implements Failure {
  final String message;

  LocalException({this.message = 'Something went wrong locally :('});

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
