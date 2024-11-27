import 'package:flutter/material.dart';
import 'package:store/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
