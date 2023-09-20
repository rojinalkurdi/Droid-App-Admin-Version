import 'package:flutter/material.dart';

class CustomAdminCard extends StatelessWidget {
  final void Function() onClick;
  final String imgUrl;
  final String title;
  const CustomAdminCard({super.key, required this.imgUrl, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgUrl, width: 80),
            Text(title),
          ],
        ),
      ),
    );
  }
}
