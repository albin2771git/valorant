import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant/src/core/constants/app_colors.dart';
import 'package:valorant/src/core/constants/app_strings.dart';
import 'package:valorant/src/features/buddies/provider/buddies_provider.dart';

class BuddiesList extends ConsumerStatefulWidget {
  const BuddiesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuddiesListState();
}

class _BuddiesListState extends ConsumerState<BuddiesList> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final apidata = ref.watch(buddiesapidataProvider).value?.data;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            AppStrings.Buddies,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: apidata != null
            ? Container(
                width: _size.width,
                // height: _size.width,
                decoration: const BoxDecoration(color: AppColors.white),
                child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: Container(
                            width: _size.width,
                            height: 120,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: _size.height,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 1),
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(apidata[index]
                                                .displayIcon
                                                .toString()))),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          apidata[index].displayName.toString(),
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    itemCount: apidata!.length),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
