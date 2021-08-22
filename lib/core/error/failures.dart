import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({this.message = 'Something went wrong on the server :('});

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

class LocalFailure extends Failure {
  final String message;

  LocalFailure({this.message = 'Something went wrong locally :('});

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
