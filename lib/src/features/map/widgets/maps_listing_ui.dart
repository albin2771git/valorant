import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant/src/core/constants/app_colors.dart';
import 'package:valorant/src/core/constants/app_strings.dart';
import 'package:valorant/src/features/map/provider/map_provider.dart';

class MapListing extends ConsumerStatefulWidget {
  const MapListing({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapListingState();
}

class _MapListingState extends ConsumerState<MapListing> {
  @override
  Widget build(BuildContext context) {
    final apidata = ref.watch(mapProvider).value?.data;
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.map,
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
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: _size.width,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apidata[index].displayName.toString(),
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.network(
                                      apidata[index].splash.toString(),
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                          ),
                        )),
              )
            : const Center(child: CupertinoActivityIndicator()));
  }
}
