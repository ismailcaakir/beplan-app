import 'package:beplan/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NoEntityWidget extends StatelessWidget {
  final String text;
  final String subtext;
  const NoEntityWidget({Key? key, required this.text, required this.subtext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "lib/assets/icons/no_entity.svg",
            semanticsLabel: 'NoEntityIcon',
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            text.tr,
            style: TextStyle().copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            subtext.tr,
            style: TextStyle().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
