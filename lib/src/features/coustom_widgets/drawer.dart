import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valorant/src/core/constants/app_colors.dart';
import 'package:valorant/src/core/constants/app_strings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 4),
                      color: AppColors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(
                      "assets/svg/valorant.svg",
                      color: AppColors.primaryColor,
                    ),
                  ),
                )),
            const Text(
              AppStrings.valorant,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider()
          ],
        )
      ],
    );
  }
}
