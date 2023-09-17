import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/shared/themes/app_theme.dart';
import 'package:luvit_assessment/ui/components/date_card_details.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';
import 'package:luvit_assessment/ui/widgets/current_card_indicator.dart';

class SingleDateCard extends StatefulWidget {
  SingleDateCard({required this.data, super.key});

  final DateCardData data;

  @override
  State<SingleDateCard> createState() => _SingleDateCardState();
}

class _SingleDateCardState extends State<SingleDateCard> {
  final HomeController controller = Get.find();

  int currentIndex = 0;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isActive = controller.isActive(widget.data);
      currentIndex = isActive ? controller.currentDatePage : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      decoration: AppTheme.dateCardDecoration,
      child: Stack(
        children: [
          DateCardDetails(
            data: widget.data,
            index: currentIndex,
            isActive: isActive,
            onChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: SizedBox(
              height: 20,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CurrentCardIndicator(
                    index: index,
                    activeIndex: isActive ? controller.currentDatePage : 0,
                  );
                },
                itemCount: widget.data.images.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
