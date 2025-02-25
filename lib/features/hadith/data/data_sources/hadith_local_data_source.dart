import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mensaje_eterno/core/constants/app_keys.dart';
import 'package:mensaje_eterno/core/services/archive_service.dart';
import 'package:mensaje_eterno/core/services/shared_preferences_service.dart';
import 'package:mensaje_eterno/features/hadith/data/models/hadith_model.dart';
import 'package:mensaje_eterno/features/hadith/presentation/model/sunnah_data_model.dart';

abstract class HadithLocalDataSource {
  Future<List<SunnahHadithModel>> getHadithes();
  Future<List<SunnahDataModel>> getSunnah(String path);
}

class HadithLocalDataSourceImpl extends HadithLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  HadithLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<SunnahHadithModel>> getHadithes() async {
    try {
      String? fileContent = await archiveService.readFile(name: AppKeys.hadith);

      List<SunnahHadithModel> sunnahHadithes = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent) as Map<String, dynamic>;
        sunnahHadithes = jsonData.entries
            .map((entry) => SunnahHadithModel.fromJson(entry.value, entry.key))
            .toList();
      }
      return sunnahHadithes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SunnahDataModel>> getSunnah(String path) async {
    try {
      String file = await rootBundle.loadString(path);
      List data = json.decode(file);
      final ref =
          data.map((element) => SunnahDataModel.fromjson(element)).toList();
      return ref;
    } catch (e) {
      rethrow;
    }
  }
}
