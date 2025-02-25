import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/features/sites/presentation/controller/terminology_controller.dart';
import 'package:mensaje_eterno/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:mensaje_eterno/features/sites/presentation/widget/artical_custom.dart';
import 'package:mensaje_eterno/features/sites/presentation/widget/inkwell_custom.dart';

class TerminologySearch extends StatelessWidget {
  const TerminologySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Terminology').customAppBar(context),
      body: GetBuilder<TerminologyControllerImp>(builder: (controller) {
        if (controller.articals.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: controller.searchResult.length,
            itemBuilder: (context, index) {
              return InkwellCustom(
                catigory: false,
                dataText: controller.searchResult[index].name,
                onTap: () {
                  Get.to(ArticalCustom(
                    dataText: controller.searchResult[index].content,
                  ));
                },
              );
            });
      }),
    );
  }
}
