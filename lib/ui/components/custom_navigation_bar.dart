import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';

// a custom bottom navigation bar that is used in the app
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      items: [
        TabItem(icon: Image.asset(ImageConstants.homeIcon), title: "홈"),
        TabItem(icon: Image.asset(ImageConstants.location2), title: "스팟"),
        TabItem(
          icon: Image.asset(
            ImageConstants.central,
          ),
        ),
        TabItem(
          icon: Image.asset(ImageConstants.messages),
          title: "채팅",
        ),
        TabItem(
          icon: Image.asset(ImageConstants.profile),
          title: "마이",
        )
      ],
      cornerRadius: 20,
      initialActiveIndex: 1,
      height: 70,
      activeColor: Colors.white24,
      color: Colors.white24,
      backgroundColor: Colors.black,
      elevation: 1,
      shadowColor: Colors.white24,
      onTap: (int i) => print('click index=$i'),
    );
  }
}
