import 'package:flutter/material.dart';


class CustomTitle extends StatelessWidget {
  final String text;
  const CustomTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(color: Colors.black54),
      textAlign: TextAlign.center,
    );
  }
}
