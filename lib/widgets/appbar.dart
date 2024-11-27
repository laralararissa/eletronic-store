import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  const AppBarWidget({super.key, this.onMenuPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const SizedBox.shrink(),
      leadingWidth: 0,
      title: Row(
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/logo.png',
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'COMMERCE PLAY',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onMenuPressed,
        ),
      ],
    );
  }
}
