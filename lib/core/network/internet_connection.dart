import 'package:data_connection_checker/data_connection_checker.dart';

abstract class InternetConnection {
  Future<bool> get isConnected;
}

class InternetConnectionImpl extends InternetConnection {
  DataConnectionChecker dataConnectionChecker;
  InternetConnectionImpl({
    required this.dataConnectionChecker,
  });

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
