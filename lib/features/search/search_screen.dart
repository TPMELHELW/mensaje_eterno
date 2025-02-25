import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/widgets/item%20_card.dart';
import 'package:mensaje_eterno/features/advanced_learning/presentation/screens/special_site.dart';
import 'package:mensaje_eterno/features/hadith/presentation/screens/search/hadith_search_screen.dart';
import 'package:mensaje_eterno/features/home/presentation/widgets/home_card.dart';
import 'package:mensaje_eterno/features/quran/presentation/screens/quran_screen.dart';
import 'package:mensaje_eterno/features/search/controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchScreenController>(
          init: SearchScreenController(),
          builder: (controller) {
            return SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      child: TextFormField(
                        controller: controller.search,
                        onChanged: (String query) {
                          controller.searchFun(query);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[400],
                          hintText: 'Search...',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ToggleButtons(
                      isSelected: controller.isCheck,
                      selectedColor: Colors.red,
                      onPressed: controller.onTap,
                      borderRadius: BorderRadius.circular(10),
                      selectedBorderColor: Colors.black,
                      fillColor: Colors.orangeAccent,
                      renderBorder: false,
                      children: List.generate(
                        controller.selection.length,
                        (int index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              controller.selection[index].image,
                              width: 23,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.itemCount,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => controller
                                        .selectedSection ==
                                    0 &&
                                controller
                                    .quranController.searchResults.isNotEmpty
                            ? SearchResultWidget(
                                searchResult: controller
                                    .quranController.searchResults[index],
                              )
                            : controller.selectedSection == 1
                                ? HomeCard(
                                    homeCardData: controller
                                        .homeController.searchResult[index])
                                : controller.selectedSection == 2
                                    ? HadithSearchScreen(
                                        data: controller.hadithController
                                            .searchResultArabic[index],
                                      )
                                    : controller.selectedSection == 3
                                        ? InkWell(
                                            onTap: () {
                                              controller
                                                  .advancedLearningController
                                                  .changeSelectedPart(index);
                                              Get.to(() => const SpecialSite());
                                            },
                                            child: ItemCard(
                                              titleSite: controller
                                                  .advancedLearningController
                                                  .searchResult[index]['title'],
                                            ),
                                          )
                                        : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
