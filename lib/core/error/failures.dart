import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);
  @override
  List<Object> get props => [message];
  @override
  bool get stringify => true;
}

class ServerFailure extends Failure {
  ServerFailure({String message = 'Something went wrong on the server :('})
      : super(message);
}

class LocalFailure extends Failure {
  LocalFailure(
      {String message =
          'Something went wrong locally (check your internet connection) :('})
      : super(message);
}
