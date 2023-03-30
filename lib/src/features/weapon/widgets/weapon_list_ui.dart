import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant/src/features/weapon/provider/weapon_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class WeaponUi extends ConsumerStatefulWidget {
  const WeaponUi({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeaponUiState();
}

class _WeaponUiState extends ConsumerState<WeaponUi> {
  @override
  Widget build(BuildContext context) {
    // final apidata = null;
    final apidata = ref.watch(weaponProvider).value?.data;
    final _size = MediaQuery.of(context).size;
    print(apidata);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.weapon,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: apidata != null
            ? Container(
                width: _size.width,
                height: _size.height,
                decoration: const BoxDecoration(color: AppColors.white),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: apidata.length,
                  itemBuilder: (context, index) => const SizedBox(),
                  // itemBuilder: (context, index) => Padding(
                  //       padding: const EdgeInsets.all(12.0),
                  //       child: Container(
                  //         width: _size.width,
                  //         height: 250,
                  //         decoration: BoxDecoration(
                  //           color: AppColors.white,
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               apidata[index].displayName.toString(),
                  //               style: const TextStyle(
                  //                   color: AppColors.primaryColor,
                  //                   fontSize: 22,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontStyle: FontStyle.italic),
                  //             ),
                  //             ClipRRect(
                  //                 borderRadius: BorderRadius.circular(6),
                  //                 child: Image.network(
                  //                   apidata[index].displayIcon.toString(),
                  //                   fit: BoxFit.cover,
                  //                 )),
                  //           ],
                  //         ),
                  //       ),
                  //     )),
                ))
            : const Center(child: CupertinoActivityIndicator()));
  }
}
