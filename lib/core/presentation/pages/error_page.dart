import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String image;
  final String text;
  const ErrorPage({
    this.image = 'assets/images/error_robot.png',
    this.text = 'Something went wrong',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(this.image),
            Text(
              this.text,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
