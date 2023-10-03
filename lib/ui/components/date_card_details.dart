import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';
import 'package:luvit_assessment/ui/widgets/date_card_bottom.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';

// This widget holds the image in the background and the details of a date
class DateCardDetails extends StatelessWidget {
  DateCardDetails(
      {required this.data,
      required this.index,
      this.isActive = false,
      this.onChanged,
      super.key});

// the user data
  final DateCardData data;

// the index of the date card
  final int index;

// whether the date card is the one currently being shown in the center
  final bool isActive;

// the callback to be called when the user changes the image/background/story
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
                child: CachedNetworkImage(
                  imageUrl: data.images[index],
                  fit: BoxFit.fitHeight,
                  width: 340,
                  height: 600,
                  placeholder: (context, url) => Image.asset(
                    ImageConstants.dateImage1,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    ImageConstants.dateImage3,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            // the bottom part of the date card that holds all the details
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

    // if the user taps on the left half of the screen, the previous image is shown
    // if the user taps on the right half of the screen, the next image is shown
    // the conditions are true if the tapped area is in the top half of the screen
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
