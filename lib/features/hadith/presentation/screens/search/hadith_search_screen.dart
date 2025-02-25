import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mensaje_eterno/core/constants/app_assets.dart';
import 'package:mensaje_eterno/core/constants/app_colors.dart';
import 'package:mensaje_eterno/core/services/easy_loader_service.dart';
import 'package:mensaje_eterno/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/features/hadith/data/models/hadith_model.dart';
// import 'package:mensaje_eterno/features/hadith/presentation/controller/hadith_controller.dart';

class HadithSearchScreen extends StatelessWidget {
  final SunnahHadithModel data;
  // final ;
  const HadithSearchScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // final HadithController controller = HadithController.instance;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.kGreenColor,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  var mm = ClipboardData(text: data.hadiths['ar'].toString());
                  await Clipboard.setData(mm);
                  EasyLoaderService.showToast(message: "Copied");
                },
                child: SvgPicture.asset(
                  AppAssets.kCopyIcon,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: context.width * 0.7,
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 50),
                  child: Text(
                    data.hadiths['ar'].toString(),
                    style: Styles.textStyle18Godlen,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width - 70),
                child: Text(
                  data.hadiths['es'].toString(),
                  style: Styles.textStyle18Black,
                  textDirection: TextDirection.ltr,
                ),
              ),
              InkWell(
                onTap: () async {
                  var mm = ClipboardData(
                    text: data.hadiths['es'].toString(),
                  );
                  await Clipboard.setData(mm);
                  EasyLoaderService.showToast(message: "Copied");
                },
                child: SvgPicture.asset(
                  AppAssets.kCopyIcon,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
