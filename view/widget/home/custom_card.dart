import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
class AdvertsCard extends StatelessWidget {
  final String title;
  final String bodyText;
  const AdvertsCard({super.key, required this.title, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return   Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.darkYellow,
                        ),
                        child: ListTile(
                          title: Text(
                            title,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          subtitle: Text(
                              bodyText,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 25, color: Colors.white)),
                        ),
                      );
  }
}