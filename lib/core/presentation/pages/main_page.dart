import 'package:clementoni/core/presentation/widgets/app_bar.dart';
import 'package:clementoni/features/products/presentation/pages/products_page.dart';
import 'package:clementoni/main.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final _pageController = PageController();
  final _pages = [
    ProductsPage(),
  ];
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: PageView(
        controller: _pageController,
        children: _pages,
      ),
    );
  }
}
