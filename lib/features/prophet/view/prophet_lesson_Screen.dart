import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_colors.dart';
import 'package:mensaje_eterno/core/helper/extensions/assetss_widgets.dart';
import 'package:mensaje_eterno/core/styles/text_styles.dart';
import 'package:mensaje_eterno/core/widgets/copy_button.dart';
import 'package:mensaje_eterno/features/prophet/controller/prophet_controller.dart';

class ProphetLessonScreen extends StatelessWidget {
  ProphetLessonScreen(
      {required this.courseIndex, required this.lessonIndex, super.key});
  final int courseIndex;
  final int lessonIndex;
  ProphetController prophetController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${prophetController.prophetModel.courses![courseIndex].lessons![lessonIndex].title}'),
          actions: [
            CopyButton(
                text: prophetController.prophetModel.courses![courseIndex]
                    .lessons![lessonIndex].body
                    .toString()),
          ]),
      body: Container(
        color: AppColors.kPrimaryColor,
        child: Padding(
            padding: 20.aEdge,
            child: SingleChildScrollView(
                child: Text(
              '${prophetController.prophetModel.courses![courseIndex].lessons![lessonIndex].body}',
              style: Styles.textStyle18Golden,
            ))),
      ),
    );
  }
}
