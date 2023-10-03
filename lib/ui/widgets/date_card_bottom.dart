import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';
import 'package:luvit_assessment/ui/widgets/tag_holder.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';
import 'package:luvit_assessment/utils/functions.dart';

class DateCardBottom extends StatelessWidget {
  const DateCardBottom({required this.data, this.index = 0, super.key});

  final DateCardData data;
  final int index;

  HomeController get controller => Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.currentUser.name == data.name
                        ? Obx(
                            () => TagHolder(
                              title: controller.currentDateLikeCount.toString(),
                              emoji: ImageConstants.star,
                              isLikeCount: true,
                            ),
                          )
                        : TagHolder(
                            title: data.likeCount.toString(),
                            emoji: ImageConstants.star,
                            isLikeCount: true,
                          ),
                    SizedBox(
                      height: 5,
                    ),
                    nameAndAge(),
                    SizedBox(
                      height: 5,
                    ),
                    extras(index),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.likeDate();
                },
                child: Container(
                  decoration: AppTheme.likeButtonDecoration,
                  child: Container(
                      margin: EdgeInsets.all(15),
                      child: Image.asset(
                        ImageConstants.like,
                        width: 20,
                        height: 20,
                      )),
                ),
              )
            ]),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        )
      ],
    );
  }

  Widget extras(int index) {
    switch (index) {
      case 0:
        return Row(
          children: [
            Text(
              data.location,
              style: AppTheme.subtitleTextStyle,
            ),
          ],
        );
      case 1:
        return Text(
          data.description,
          style: AppTheme.subtitleTextStyle,
        );
      default:
        return Wrap(
          children: [
            //replace with firebase database tags when fixed data is available
            ...emojiTitlePairs.entries
                .map((e) => TagHolder(title: e.value, emoji: e.key))
                .toList()
          ],
        );
    }
  }

  Widget nameAndAge() {
    return Row(
      children: [
        Flexible(
          child: Text(
            data.name,
            style: AppTheme.titleTextStyle,
          ),
        ),
        Text(
          data.age.toString(),
          style: AppTheme.ageTextStyle,
        ),
      ],
    );
  }
}
