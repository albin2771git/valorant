import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant/src/features/agent/provider/agent_provider.dart';

class AgentCarousel extends ConsumerStatefulWidget {
  const AgentCarousel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AgentCarouselState();
}

class _AgentCarouselState extends ConsumerState<AgentCarousel> {
  @override
  Widget build(BuildContext context) {
    final apiData = ref.watch(apidataProvider).value?.data;
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 300,
      child: CarouselSlider.builder(
          itemCount: apiData!.length,
          itemBuilder: (context, itemindex, pageIndex) => Container(
                width: size.width,
                height: 300,
                child:
                    Image.network(apiData[itemindex].fullPortrait.toString()),
              ),
          options: CarouselOptions(
            height: size.height,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 1),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.7,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
