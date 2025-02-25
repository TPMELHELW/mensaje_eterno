import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/features/newMuslims/model/category_Sp_model.dart';
import '../model/NewMuslimsModel.dart';

class NewMuslimsController extends GetxController {
  static NewMuslimsController get instance => Get.find<NewMuslimsController>();
  RxBool isLoading = true.obs;
  RxBool isLoading1 = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    loadJsonFileCategory();
    super.onInit();
  }

  late NewMuslimsModel newMuslimsModel;
  List<CategorySpModel> categorySpModel = [];
  Future<void> loadJsonFile() async {
    String data =
        await rootBundle.loadString('assets/json/Sp-newmuslimscourse.json');
    // print(data);
    newMuslimsModel = NewMuslimsModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }

  Future<void> loadJsonFileCategory() async {
    String data =
        await rootBundle.loadString('assets/json/sp-newmuslim-category.json');
    var jsondata = jsonDecode(data);
    jsondata['data'].forEach((v) {
      categorySpModel.add(CategorySpModel.fromJson(v));
    });
    isLoading1.value = false;
  }
}
