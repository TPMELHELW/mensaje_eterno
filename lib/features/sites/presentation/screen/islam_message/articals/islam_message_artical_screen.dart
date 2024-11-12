import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_enums.dart';
import 'package:mensaje_eterno/core/widgets/search_field_widget.dart';
import 'package:mensaje_eterno/features/sites/presentation/controller/islam_messages/islam_message_controller.dart';
import 'package:mensaje_eterno/features/sites/presentation/screen/islam_message/articals/search/islam_message_article_search.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'islam_message_artical_contain_screen.dart';

class IslamMessageArticalScreen extends StatelessWidget {
  const IslamMessageArticalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Artical")
          .customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => controller.getArticalsState !=
                  StateType.success
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SearchFieldWidget(
                      text: 'Buscar en artículos',
                      onSubmitted: (val) => {
                        controller.searchFun(val),
                        val.isEmpty
                            ? null
                            : Get.to(() => const IslamMessageArticalSearch())
                      },
                      formState: controller.formState,
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(5),
                          itemCount: controller.articals.length,
                          itemBuilder: (context, index) {
                            return InkwellCustom(
                              catigory: false,
                              dataText: controller.articals[index].name,
                              onTap: () {
                                Get.to(IslamMessageContainArticalScreen(
                                  index: index,
                                ));
                              },
                            );
                          }),
                    ),
                  ],
                )),
    );
  }
}
