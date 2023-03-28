import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:valorant/src/core/constants/app_colors.dart';
import 'package:valorant/src/core/constants/app_strings.dart';
import '../../../../main.dart';
import '../../agent_detail_page/agent_detail-page.dart';

class AgentListViewUI extends ConsumerStatefulWidget {
  const AgentListViewUI({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AgentListViewUIState();
}

class _AgentListViewUIState extends ConsumerState<AgentListViewUI> {
  @override
  Widget build(BuildContext context) {
    final apiData = ref.watch(apidataProvider).value?.data;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.valorant,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: apiData != null
            ? AnimationLimiter(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    itemBuilder: (context, index) {
                      final displayName = apiData[index].displayName ?? "-";
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 800),
                        columnCount: apiData.length,
                        child: SlideAnimation(
                          verticalOffset: 350.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AgentDetailPage(
                                            networkimg: apiData[index]
                                                .background
                                                .toString(),
                                            avatarimg: apiData[index]
                                                .fullPortrait
                                                .toString(),
                                            name: apiData[index]
                                                .displayName
                                                .toString(),
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: CircleAvatar(
                                        maxRadius: 60,
                                        minRadius: 40,
                                        backgroundColor: AppColors.white,
                                        child: Image.network(
                                            apiData[index].displayIcon ?? ""),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          displayName,
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: apiData.length),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
