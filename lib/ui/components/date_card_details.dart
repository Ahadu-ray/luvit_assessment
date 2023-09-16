import 'package:flutter/material.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';

class DateCardDetails extends StatelessWidget {
  const DateCardDetails({required this.data, required this.index, super.key});

  final DateCardData data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [Colors.white, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(rect);
          },
          child: Container(
              decoration: AppTheme.dateCardDecoration,
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                  ImageConstants.dateImages[index < 2 ? index : 2],
                  fit: BoxFit.fill)),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name + " " + index.toString(),
                    style: AppTheme.normalTextStyle),
                Text(data.description, style: AppTheme.normalTextStyle)
              ],
            ))
      ],
    );
  }
}
