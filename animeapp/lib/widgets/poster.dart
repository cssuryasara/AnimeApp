import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String _bannerPath;

  Poster(this._bannerPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ClipPath(
          clipper: ClippingClass(),
          child: Container(
              constraints: BoxConstraints.expand(
                height: 400,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.network(
                _bannerPath,
                fit: BoxFit.cover,
              )),
        ));
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo((size.width - size.width / 4), size.height,
        size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
