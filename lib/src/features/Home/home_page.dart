import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';

import 'package:valorant/src/core/constants/app_strings.dart';
import 'package:valorant/src/features/agent/widgets/agents_list_view.dart';
import 'package:valorant/src/features/coustom_widgets/drawer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../core/constants/app_colors.dart';
import '../coustom_widgets/list_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> category = [
    "Agents",
    "Buddies",
    "Bundles",
    "Ceremonies",
    "Competitive Tiers",
    "Content Tires",
    "Contracts",
    "Curencies",
    "Events",
    "GameModes",
    "Gear",
    "Level Borders",
    "Maps",
    "Player Cards",
    "Player Titles",
    "Seasons",
    "Sprays",
    "Themes",
    "Weapons",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: AppColors.primaryColor, size: 32),
          centerTitle: true,
          title: const Text(AppStrings.valorant,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28)),
        ),
        drawer: const Drawer(
          elevation: 1,
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          child: CustomDrawer(),
        ),
        body: bodyPart());
  }

  Widget bodyPart() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(color: AppColors.primaryColor, width: 4),
                    color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    "assets/svg/valorant.svg",
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SizedBox(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              CommonListTile(
                name: category[0],
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const AgentListViewUI())));
                },
              ),
              CommonListTile(
                name: category[1],
                callback: () {},
              ),
              CommonListTile(
                name: category[2],
                callback: () {},
              ),
              CommonListTile(
                name: category[3],
                callback: () {},
              ),
              CommonListTile(
                name: category[4],
                callback: () {},
              ),
              CommonListTile(
                name: category[5],
                callback: () {},
              ),
              CommonListTile(
                name: category[6],
                callback: () {},
              ),
              CommonListTile(
                name: category[7],
                callback: () {},
              ),
              CommonListTile(
                name: category[8],
                callback: () {},
              ),
              CommonListTile(
                name: category[9],
                callback: () {},
              ),
              CommonListTile(
                name: category[10],
                callback: () {},
              ),
              CommonListTile(
                name: category[11],
                callback: () {},
              ),
              CommonListTile(
                name: category[12],
                callback: () {},
              ),
              CommonListTile(
                name: category[13],
                callback: () {},
              ),
              CommonListTile(
                name: category[14],
                callback: () {},
              ),
              CommonListTile(
                name: category[15],
                callback: () {},
              ),
              CommonListTile(
                name: category[16],
                callback: () {},
              ),
              CommonListTile(
                name: category[17],
                callback: () {},
              ),
              CommonListTile(
                name: category[18],
                callback: () {},
              ),
            ],
          )),
        )
      ],
    );
  }
}
