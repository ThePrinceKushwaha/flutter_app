import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/bg3.jpg",
      fit: BoxFit.cover,
    );
  }
}
