import 'package:flutter/material.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "추천 드릴 친구들을 준비 중이에요",
            textAlign: TextAlign.center,
            style: AppTheme.titleTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "매일 새로운 친구들을 소개시켜드려요",
            style: AppTheme.subtitleTextStyle,
          ),
        ],
      )),
    );
  }
}
