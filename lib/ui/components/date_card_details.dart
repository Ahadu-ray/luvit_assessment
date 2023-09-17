import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';
import 'package:luvit_assessment/ui/widgets/date_card_bottom.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';

class DateCardDetails extends StatelessWidget {
  DateCardDetails(
      {required this.data,
      required this.index,
      this.isActive = false,
      this.onChanged,
      super.key});

  final DateCardData data;
  final int index;
  final bool isActive;
  final ValueSetter<int>? onChanged;

  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: isActive ? _onTapDown : null,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(rect);
            },
            child: Container(
                decoration: AppTheme.dateCardDecoration,
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  ImageConstants.dateImages[index < 2 ? index : 2],
                )),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: DateCardBottom(
              data: data,
              index: index,
            ),
          )
        ],
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    double screenWidth = Get.width;
    double screenHeight = Get.height;
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;

    print(dx);

    if (dy < screenHeight / 2) {
      if (dx < screenWidth / 2) {
        if (controller.currentDatePage == 0) {
          controller.currentDatePage = data.images.length - 1;
        } else {
          controller.currentDatePage--;
        }
      } else {
        if (controller.currentDatePage == data.images.length - 1) {
          controller.currentDatePage = 0;
        } else {
          controller.currentDatePage++;
        }
      }
      if (onChanged != null) onChanged!(controller.currentDatePage);
    }
  }
}
