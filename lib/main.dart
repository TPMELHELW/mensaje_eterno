import 'package:get/get.dart';
import 'package:mensaje_eterno/data/local/local_data.dart';
import 'package:mensaje_eterno/features/splash/screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:mensaje_eterno/ys_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  Get.put(pref);
  await LocalData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const YsMaterialApp(
      title: 'El Mensaje Eterno',
      home: SplashPage(),
    );
  }
}
