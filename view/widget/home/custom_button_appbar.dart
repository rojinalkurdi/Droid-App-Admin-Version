import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';


class CustomButtonAppBar extends StatelessWidget {
  final void Function() onpressed;
  final IconData icon;
  final String title;
  final bool active ;
  const CustomButtonAppBar({
    super.key,
    required this.onpressed,
    required this.icon,
    required this.title,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: active == true ? AppColors.darkYellow : AppColors.grey),
          Text(title,
              style: TextStyle(
                  color:
                      active == true ? AppColors.darkYellow : AppColors.grey))
        ],
      ),
    );
  }
}
