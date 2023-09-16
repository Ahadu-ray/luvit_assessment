import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset(
                ImageConstants.location,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: Get.width * 0.5,
                child: Text('목이길어슬픈기린님의 새로운 스팟',
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.normalTextStyle),
              )
            ],
          ),
          Row(
            children: [
              Container(
                decoration: AppTheme.chipDecoration,
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '323233',
                      style: AppTheme.normalTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                ImageConstants.notification,
                width: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
