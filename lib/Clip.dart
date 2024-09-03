import 'package:flutter/material.dart';

class CustomClipperShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cutSize = 15.0; // Size of the small box cutout
    double padding = 5.0; // Padding from the corner

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - cutSize - padding);
    path.lineTo(
        size.width - cutSize - padding, size.height - cutSize - padding);
    path.lineTo(size.width - cutSize - padding, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
