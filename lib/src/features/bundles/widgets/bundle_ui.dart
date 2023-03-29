import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../provider/bundles_provider.dart';

class BundleUI extends ConsumerStatefulWidget {
  const BundleUI({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BundleUIState();
}

class _BundleUIState extends ConsumerState<BundleUI> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final apidata = ref.watch(apidataProviderbundle).value?.data;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            AppStrings.bundle,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: apidata == null
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
                            height: 200,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    width: 160,
                                    height: _size.height,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 1),
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(apidata[index]
                                                .verticalPromoImage
                                                .toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    itemCount: apidata!.length),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
