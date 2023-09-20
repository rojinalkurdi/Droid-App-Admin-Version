import 'package:flutter/material.dart';

class SignInUpText extends StatelessWidget {
  final String txt;
  final void Function() onTap;
  final String inkwellText;

  const SignInUpText({super.key, required this.txt, required this.onTap, required this.inkwellText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(txt, style: Theme.of(context).textTheme.displayLarge),
          InkWell(
            onTap: onTap,
            child:
                Text(inkwellText, style: Theme.of(context).textTheme.bodyLarge),
          )
        ],
      ),
    );
  }
}
