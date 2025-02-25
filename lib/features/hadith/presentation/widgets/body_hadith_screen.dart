import 'package:mensaje_eterno/core/widgets/primary_list_tile.dart';
import 'package:mensaje_eterno/features/hadith/data/models/hadith_model.dart';
import 'package:mensaje_eterno/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:mensaje_eterno/features/hadith/presentation/screens/book_hadithes_screen.dart';
import 'package:mensaje_eterno/features/hadith/presentation/widgets/albukhary_muslim_screens/albukhary_muslim_screen.dart';
import 'package:mensaje_eterno/features/hadith/presentation/widgets/book_screens/book_screen.dart';

class BodyHadithScreen extends StatelessWidget {
  const BodyHadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HadithController controller = HadithController.instance;
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.hadithsData.length,
          itemBuilder: (context, index) {
            String bookName = controller.hadithsData[index].bookName;
            return PrimaryListTile(
              onTap: () {
                if (index == 5 || index == 6) {
                  final SunnahHadithModel data = controller.hadithsData[index];
                  Get.to(() => AlbukharyMuslimScreen(data: data));
                } else if (index >= 7) {
                  final SunnahHadithModel data = controller.hadithsData[index];
                  Get.to(() => BookScreen(
                        data: data,
                      ));
                } else {
                  Get.to(() => BookHadithesScreen(
                      index, 'sunnah', controller.hadithsData[index].bookName));
                }
              },
              es: bookName,
              itemNumber: index + 1,
              ar: '',
              isSaved: false,
            );
          }),
    );
  }
}
