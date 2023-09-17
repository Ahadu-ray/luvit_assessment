import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/ui/components/custom_navigation_bar.dart';
import 'package:luvit_assessment/ui/components/single_date_card.dart';
import 'package:luvit_assessment/ui/components/top_bar.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';
import 'package:luvit_assessment/ui/widgets/empty_list.dart';

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
                    // if data is being loaded from firebase show a circular progress indicator
                    if (controller.status.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      // if there is no data show an empty list
                      if (controller.users.isEmpty) {
                        return const EmptyList();
                      }
                      // if there is data show the list of users in a horizontal list view
                      return ListView.builder(
                        controller: controller.scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // wrap each user in a dismissible widget so that it can be dismissed when swiped down
                          return Dismissible(
                            direction: DismissDirection.down,
                            key: Key(controller.users[index].name),
                            child:
                                SingleDateCard(data: controller.users[index]),
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
          bottomNavigationBar: const CustomNavigationBar()),
    );
  }
}
