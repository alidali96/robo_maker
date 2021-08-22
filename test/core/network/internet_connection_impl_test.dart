import 'package:clementoni/core/network/internet_connection.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'internet_connection_impl_test.mocks.dart';

@GenerateMocks([DataConnectionChecker])
void main() {
  final mockDataConnectionChecker = MockDataConnectionChecker();
  final internetConnectionImpl = InternetConnectionImpl(
    dataConnectionChecker: mockDataConnectionChecker,
  );

  group('isConnected', () {
    final connected = true;
    test('should call hasConnetion method', () async {
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => connected);
      final result = await internetConnectionImpl.isConnected;
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, connected);
    });
  });
}
