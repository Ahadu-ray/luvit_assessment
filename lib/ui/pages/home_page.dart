import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/ui/components/single_date_card.dart';
import 'package:luvit_assessment/ui/components/top_bar.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';
import 'package:luvit_assessment/utils/constants/asset_constants/image_constants.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.customBlack,
        body: Column(
          children: [
            TopBar(),
            Flexible(
              child: Obx(
                () {
                  if (controller.status.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (controller.users.isEmpty) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "추천 드릴 친구들을 준비 중이에요",
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
                      ));
                    }
                    return ListView.builder(
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.down,
                          key: Key(controller.users[index].name),
                          child: SingleDateCard(data: controller.users[index]),
                          onDismissed: (direction) {
                            controller.removeDate();
                          },
                        );
                      },
                      itemCount: controller.users.length,
                      scrollDirection: Axis.horizontal,
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
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
          backgroundColor: AppTheme.customBlack,
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }
}
