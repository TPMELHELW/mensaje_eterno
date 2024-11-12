import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_enums.dart';
import 'package:mensaje_eterno/features/sites/presentation/controller/islam_messages/islam_message_audios_quran_videos_controller.dart';
import 'package:mensaje_eterno/features/sites/presentation/widget/view_or_download_inkwell.dart';
import '../../../widget/app_bar_custom.dart';

class IslamMessageQuranVideosMainScreen
    extends GetView<IslamMessageQuranVideosControllerImp> {
  const IslamMessageQuranVideosMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Quran Videos")
          .customAppBar(context),
      body: GetBuilder<IslamMessageQuranVideosControllerImp>(
          builder: (controller) {
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
                  final ele = controller.data[index];
                  return ViewOrDownloadInkwell(
                    url: ele.url,
                    name: ele.name,
                    mediaLinkType: MediaLinkType.video,
                  );
                }));
      }),
    );
  }
}
