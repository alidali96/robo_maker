import 'package:clementoni/core/presentation/widgets/app_bar.dart';
import 'package:clementoni/features/cart/presentation/pages/cart_page.dart';
import 'package:clementoni/features/products/presentation/pages/products_page.dart';
import 'package:clementoni/features/profile/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController();

  final _pages = [
    const ProductsPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  var _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: PageView(
          controller: _pageController,
          children: _pages,
        ),
      ),
    );
  }
}
