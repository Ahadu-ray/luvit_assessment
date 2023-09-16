import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/ui/components/single_date_card.dart';
import 'package:luvit_assessment/ui/components/top_bar.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              TopBar(),
              Expanded(
                child: Obx(
                  () {
                    if (controller.status.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (controller.users.isEmpty) {
                        return const Center(child: Text('No data found'));
                      }
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return SingleDateCard(data: controller.users[index]);
                        },
                        itemCount: controller.users.length,
                        scrollDirection: Axis.horizontal,
                      );
                    }
                  },
                ),
              ),
              Container(
                height: 100,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
