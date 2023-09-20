import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //width: double.infinity,
      height: 40,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.darkYellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white, fontSize: 15)),
      ),
    );
  }
}
