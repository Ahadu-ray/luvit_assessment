import 'package:flutter/material.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';

class TagHolder extends StatelessWidget {
  const TagHolder(
      {required this.title, this.emoji, this.isLikeCount = false, super.key});

  final String title;
  final String? emoji;
  final bool isLikeCount;

  @override
  Widget build(BuildContext context) {
    bool isHeart = emoji == ImageConstants.heart;
    return Container(
        decoration: AppTheme.chipDecoration.copyWith(
            color: isHeart ? AppTheme.pink.withOpacity(0.2) : null,
            border: isHeart ? Border.all(color: AppTheme.pink) : null),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.only(right: 5, bottom: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (emoji != null) ...[
              Image.asset(emoji!, width: 20, height: 20),
              SizedBox(
                width: 10,
              ),
            ],
            Text(
              title,
              style: isLikeCount
                  ? AppTheme.numberTextStyle
                  : AppTheme.normalTextStyle,
            ),
          ],
        ));
  }
}
