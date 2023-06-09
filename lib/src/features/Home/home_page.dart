import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valorant/src/core/constants/app_strings.dart';
import 'package:valorant/src/features/agent/widgets/agents_list_view.dart';
import 'package:valorant/src/features/coustom_widgets/drawer.dart';
import 'package:valorant/src/features/map/widgets/maps_listing_ui.dart';
import '../../core/constants/app_colors.dart';
import '../agent/agent_carousel.dart';
import '../buddies/buddies_list_ui.dart';
import '../bundles/widgets/bundle_ui.dart';
import '../coustom_widgets/list_tile.dart';
import '../weapon/widgets/weapon_list_ui.dart';

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
    "Maps",
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
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BuddiesList())));
                },
              ),
              CommonListTile(
                name: category[2],
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BundleUI())));
                },
              ),
              CommonListTile(
                name: category[3],
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const MapListing())));
                },
              ),
              CommonListTile(
                name: category[4],
                callback: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              const AgentCarousel(),
            ],
          )),
        )
      ],
    );
  }
}
