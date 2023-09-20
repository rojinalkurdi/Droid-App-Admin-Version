import 'package:delivery/core/constant/image.dart';
import 'package:flutter/material.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      onBoardingImages.logoAuth,
      height: 180,
    );
  }
}
