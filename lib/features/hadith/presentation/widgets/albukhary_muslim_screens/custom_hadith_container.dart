import 'package:mensaje_eterno/core/constants/app_assets.dart';
import 'package:mensaje_eterno/core/services/easy_loader_service.dart';
import 'package:mensaje_eterno/core/styles/text_styles.dart';
import 'package:mensaje_eterno/features/hadith/presentation/widgets/hadith_arabic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHadithContainer extends StatelessWidget {
  final Map<String, dynamic> hadith;

  const CustomHadithContainer({required this.hadith, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        hadith['Hadith Ar'] == null
            ? const SizedBox()
            : HadithArabicContainer(hadithArabic: hadith['Hadith Ar']),
        const SizedBox(height: 12),
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
                  hadith['Hadith Es'],
                  style: Styles.textStyle18Black,
                  textDirection: TextDirection.ltr,
                ),
              ),
              InkWell(
                onTap: () async {
                  var data = ClipboardData(text: hadith['Hadith Es']);
                  await Clipboard.setData(data);
                  EasyLoaderService.showToast(message: "Copied");
                },
                child: SvgPicture.asset(
                  AppAssets.kCopyIcon,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
