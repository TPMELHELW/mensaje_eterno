import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_colors.dart';
import 'package:mensaje_eterno/core/helper/extensions/assetss_widgets.dart';
import 'package:mensaje_eterno/core/styles/text_styles.dart';
import 'package:mensaje_eterno/core/widgets/copy_button.dart';
import 'package:mensaje_eterno/features/faith/controller/faith_controller.dart';

class FaithLessonScreen extends StatelessWidget {
  const FaithLessonScreen(
      {required this.courseIndex, required this.lessonIndex, super.key});
  final int courseIndex;
  final int lessonIndex;
  @override
  Widget build(BuildContext context) {
    FaithController faithController = Get.find();
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '${faithController.faithModel.courses![courseIndex].lessons![lessonIndex].title}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          actions: [
            CopyButton(
                text: faithController
                    .faithModel.courses![courseIndex].lessons![lessonIndex].body
                    .toString()),
          ]),
      body: Container(
        color: AppColors.kPrimaryColor,
        child: Padding(
            padding: 20.aEdge,
            child: SingleChildScrollView(
                child: Text(
              '${faithController.faithModel.courses![courseIndex].lessons![lessonIndex].body}',
              style: Styles.textStyle18Golden,
            ))),
      ),
    );
  }
}
