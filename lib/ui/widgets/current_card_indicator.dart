import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';

class CurrentCardIndicator extends StatelessWidget {
  const CurrentCardIndicator({this.activeIndex = 0, this.index = 0, super.key});

  final int activeIndex, index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        clipBehavior: Clip.hardEdge,
        width: Get.width / 6,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Divider(
          color: activeIndex == index ? AppTheme.pink : AppTheme.customBlack,
          thickness: 4,
        ));
  }
}
