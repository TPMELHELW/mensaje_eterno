import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_colors.dart';
import 'package:mensaje_eterno/core/constants/app_svgs.dart';
import 'package:mensaje_eterno/core/constants/app_text_styles.dart';
import 'package:mensaje_eterno/core/helper/extensions/assetss_widgets.dart';
import 'package:mensaje_eterno/features/salah/model/tahara_lesson_model.dart';
import 'package:mensaje_eterno/features/salah/view/lessons_details_page.dart';
import 'package:mensaje_eterno/features/salah/view/widgets/options.dart';

class OtherLessonsPage extends StatelessWidget {
  const OtherLessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: 16.aEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.height * 0.2,
                        child: Hero(
                          tag: AppSvgs.otherLessons,
                          child: Options(
                            label: 'Other Lessons',
                            image: AppSvgs.otherLessons,
                            onTap: () {},
                          ),
                        ),
                      ),
                      20.hSize,
                      SizedBox(
                        height: context.height * 0.5,
                        child: FutureBuilder<List<TaharaLessonModel>>(
                          future: TaharaLessonFromJson.getData(),
                          builder: (context, snapshot) {
                            final taharaLessons = snapshot.data;
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              default:
                                if (snapshot.hasError) {
                                  print('snapshot.error ${snapshot.error}');
                                  return Center(
                                    child: Text(
                                        'Some error occurred ${snapshot.error}'),
                                  );
                                } else {
                                  return buildLessons(taharaLessons!);
                                }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildLessons(List<TaharaLessonModel> lessons) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        if (index > 1) {
          final lesson = lessons[index];
          return ListTile(
            leading: Text(
              '${index - 1}',
              style: AppTextColors.textStyle,
            ),
            title: Text(lesson.title, style: AppTextColors.textStyle),
            onTap: () {
              Get.to(LessonsDetailsPage(
                list: lesson.lessonDetail,
                title: lesson.title,
                icon: AppSvgs.otherLessons,
              ));
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          );
        } else {
          return Container();
        }
      });
}
