import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_enums.dart';
import 'package:mensaje_eterno/features/sites/presentation/controller/knowing_allah/knowing_allah_books_videos_controller.dart';
import 'package:mensaje_eterno/features/sites/presentation/widget/media_files_list_view.dart';
import 'package:mensaje_eterno/features/sites/presentation/widget/view_or_download_inkwell.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';

class KnowingAllahVideoScreen extends StatelessWidget {
  const KnowingAllahVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Knowing Allah Videos")
          .customAppBar(context),
      body: GetBuilder<KnowingAllahVideosControllerImp>(builder: (controller) {
        if (controller.getDataState == StateType.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return InkwellCustom(
                    catigory: false,
                    dataText: controller.data.elementAt(index).category,
                    onTap: () {
                      Get.to(MediaFilesListView(
                        data: controller.data[index].data,
                        title: controller.data[index].category,
                        mediaLinkType: MediaLinkType.video,
                      ));
                    },
                  );
                }));
      }),
    );
  }
}
