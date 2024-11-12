import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/widgets/primary_list_tile.dart';
import 'package:mensaje_eterno/features/hadith/data/models/hadith_model.dart';
import 'package:mensaje_eterno/features/hadith/presentation/widgets/albukhary_muslim_screens/albikhary_muslim_second_screen.dart';

class AlbukharyMuslimScreen extends StatelessWidget {
  final SunnahHadithModel data;
  const AlbukharyMuslimScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final List titles = data.hadiths.keys.toList();
    return Scaffold(
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return PrimaryListTile(
                itemNumber: index + 1,
                es: titles[index],
                ar: '',
                isSaved: false,
                onTap: () {
                  final ref = data.hadiths[titles[index]];
                  print(ref);
                  Get.to(
                    () => AlbikharyMuslimSecondScreen(data: ref),
                  );
                });
          }),
    );
  }
}
