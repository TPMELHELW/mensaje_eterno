import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:mensaje_eterno/features/advanced_learning/presentation/screens/advanced_site_media_main_screen.dart';
import 'package:mensaje_eterno/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:mensaje_eterno/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:mensaje_eterno/features/non_muslim/presentation/screens/non_muslim_topic_screen.dart';

class SpecialSite extends StatelessWidget {
  const SpecialSite({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdvancedLearningController>();
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                left: 10, right: 10, top: 10, bottom: Get.height / 4.5),
            itemCount: controller.page[controller.selectedPart].length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (controller.selectedPart == 0) {
                    // final cc = Get.put(NonMuslimController());
                    // print(cc.hadithes);

                    Get.to(
                      () => NonMuslimTopicsScreen(
                        topics: Get.find<NonMuslimController>()
                            .hadithes[index]
                            .topics,
                        title: Get.find<NonMuslimController>()
                            .hadithes[index]
                            .sectionName,
                      ),
                      transition: Transition.cupertino,
                    );
                  } else {
                    if (controller.page[controller.selectedPart][index]
                        ['targetScreen'] is String) {
                      Get.toNamed(
                        controller.page[controller.selectedPart][index]
                            ['targetScreen'],
                      );
                    } else {
                      Get.to(AdvancedSiteMediaMainScreen(
                          controller.page[controller.selectedPart][index]));
                    }
                  }
                },
                child: ItemCard(
                  hasCopyRights: controller.selectedPart == 0
                      ? false
                      : (controller.page[controller.selectedPart][index])
                          .containsKey("copyRight"),
                  titleSite: controller.page[controller.selectedPart][index]
                      ['title'],
                  subtitle: controller.page[controller.selectedPart][index]
                      ['description'],
                  copyRights: controller.page[controller.selectedPart][index]
                          ['copyRight'] ??
                      '',
                  link: controller.page[controller.selectedPart][index]
                          ['link'] ??
                      '',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
