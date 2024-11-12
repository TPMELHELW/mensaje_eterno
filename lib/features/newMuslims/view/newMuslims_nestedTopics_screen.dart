import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_colors.dart';
import 'package:mensaje_eterno/core/helper/extensions/assetss_widgets.dart';
import 'package:mensaje_eterno/core/styles/text_styles.dart';
import 'package:mensaje_eterno/core/widgets/copy_button.dart';
import 'package:mensaje_eterno/features/newMuslims/controller/newMuslims_controller.dart';

class NewMuslimsNestedTopicsScreen extends StatelessWidget {
  NewMuslimsNestedTopicsScreen(
      {required this.courseIndex,
      required this.lessonIndex,
      super.key,
      required this.nestedTopicsIndex});
  final int courseIndex;
  final int lessonIndex;
  final int nestedTopicsIndex;
  NewMuslimsController newMuslimsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${newMuslimsController.newMuslimsModel.courses![courseIndex].lessons![lessonIndex].nestedTopics![nestedTopicsIndex].title}'),
        actions: [
          CopyButton(
              text: newMuslimsController
                      .newMuslimsModel
                      .courses![courseIndex]
                      .lessons![lessonIndex]
                      .nestedTopics![nestedTopicsIndex]
                      .body ??
                  '')
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.kPrimaryColor,
          child: Padding(
              padding: 20.aEdge,
              child: SelectableText(
                '${newMuslimsController.newMuslimsModel.courses![courseIndex].lessons![lessonIndex].nestedTopics![nestedTopicsIndex].body}',
                style: Styles.textStyle18Golden,
              )),
        ),
      ),
    );
  }
}
