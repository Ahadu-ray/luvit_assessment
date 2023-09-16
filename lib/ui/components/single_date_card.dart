import 'package:flutter/material.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/core/shared/themes/app_theme.dart';
import 'package:luvit_assessment/ui/widgets/current_card_indicator.dart';

class SingleDateCard extends StatelessWidget {
  const SingleDateCard({ required this.data, required this.index, super.key});

  final DateCardData data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: AppTheme.dateCardDecoration.copyWith(image: DecorationImage(image: NetworkImage(data.images[index]))),
        ),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: 
          SizedBox(height: 20,
          child: ListView.builder(itemBuilder: (index,context){
            return CurrentCardIndicator();
          }, itemCount: data.images.length,
          scrollDirection: Axis.horizontal,
          ),
          ),
        ),

        Positioned(child: Column(
          
        ));
      ],
    );
  }
}