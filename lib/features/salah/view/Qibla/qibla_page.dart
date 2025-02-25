import 'package:flutter/material.dart';
import 'package:mensaje_eterno/core/constants/app_colors.dart';
import 'package:mensaje_eterno/features/salah/view/Qibla/qibla_compass.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(child: QiblaCompass()));
  }

/*static Future<bool?> androidDeviceSensorSupport() async {
    const MethodChannel _channel =
    const MethodChannel('');
    if (Platform.isAndroid)
      return await _channel.invokeMethod("androidSupportSensor");
    else
      return true;
  }*/
}
