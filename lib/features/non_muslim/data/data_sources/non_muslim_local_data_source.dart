import 'dart:convert';

import 'package:mensaje_eterno/core/constants/app_keys.dart';
import 'package:mensaje_eterno/core/services/archive_service.dart';
import 'package:mensaje_eterno/core/services/shared_preferences_service.dart';
import 'package:mensaje_eterno/features/non_muslim/data/models/course_model.dart';

abstract class NonMuslimLocalDataSource {
  Future<List<NonMuslimModel>> getCourses();
}

class NonMuslimLocalDataSourceImpl extends NonMuslimLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  NonMuslimLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<NonMuslimModel>> getCourses() async {
    try {
      String? fileContent =
          await archiveService.readFile(name: AppKeys.nonMuslims);

      List<NonMuslimModel> hadithes = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        hadithes = jsonData
            .map<NonMuslimModel>(
              (surah) => NonMuslimModel.fromJson(surah),
            )
            .toList();
      }
      // /  `

      return Future.value(hadithes /** hadithes **/);
    } catch (e) {
      rethrow;
    }
  }
}
