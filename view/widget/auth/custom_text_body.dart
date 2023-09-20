import 'package:flutter/material.dart';

class CustomTextBody extends StatelessWidget {
  final String textBody;
  const CustomTextBody({super.key, required this.textBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        textBody,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
