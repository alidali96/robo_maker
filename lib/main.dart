import 'package:flutter/material.dart';

import 'constants.dart';
import 'core/presentation/pages/error_page.dart';
import 'core/presentation/pages/main_page.dart';
import 'features/products/domain/entities/product.dart';
import 'features/products/presentation/pages/product_page.dart';
import 'injection_container.dart' as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await app.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
        primaryColor: Color(0xFF0048BA),
        accentColor: Color(0xFF2CA3B3),
        errorColor: Color(0xFFE8372D),
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Color(0xFF0048BA),
          ),
        ),
      ),
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (_) => MainPage(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          switch (settings.name) {
            case ProductPage.route:
              if (settings.arguments is Product) {
                final prodcut = settings.arguments as Product;
                return ProductPage(product: prodcut);
              } else {
                return ErrorPage();
              }

            default:
              return ErrorPage();
          }
        });
      },
    );
  }
}
