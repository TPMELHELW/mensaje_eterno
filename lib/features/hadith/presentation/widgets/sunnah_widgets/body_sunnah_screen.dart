import 'package:mensaje_eterno/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:mensaje_eterno/features/hadith/presentation/widgets/sunnah_widgets/custom_item_card.dart';

class BodySunnahScreen extends StatelessWidget {
  const BodySunnahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HadithController controller = HadithController.instance;
    return Scaffold(
      body: ListView.builder(
          itemCount: controller.sunnahData.length,
          itemBuilder: (context, index) {
            return CustomItemCard(
              titleSite: controller.sunnahData[index].title,
              subtitle: controller.sunnahData[index].subTitle,
              onPress: () async => await controller.selectSection(index),
            );
          }),
    );
  }
}
