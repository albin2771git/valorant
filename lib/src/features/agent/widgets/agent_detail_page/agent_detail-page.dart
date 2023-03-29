import 'package:flutter/material.dart';
import 'package:valorant/src/core/constants/app_colors.dart';
import 'package:valorant/src/features/agent/model/agent_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AgentDetailPage extends StatelessWidget {
  final String networkimg;
  final String avatarimg;
  final String name;
  final String description;
  final List<Ability>? abilities;
  const AgentDetailPage({
    super.key,
    required this.networkimg,
    required this.avatarimg,
    required this.name,
    required this.description,
    required this.abilities,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: SizedBox(
        width: _size.width,
        height: _size.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: _size.width,
                height: _size.height * 0.60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Stack(children: [
                  Container(
                    width: _size.width,
                    height: _size.height * 0.60,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: CarouselSlider(
                        items: [
                          Image.network(
                            networkimg,
                            height: _size.height,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            avatarimg,
                            height: _size.height,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            networkimg,
                            height: _size.height,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            avatarimg,
                            height: _size.height,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            networkimg,
                            height: _size.height,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            avatarimg,
                            height: _size.height,
                            fit: BoxFit.cover,
                          ),
                        ],
                        options: CarouselOptions(
                          height: _size.height,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.network(
                      avatarimg,
                      height: _size.height,
                      fit: BoxFit.cover,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Wrap(
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: abilities?.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      abilities![index].slot.toString(),
                                      style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Name : ${abilities![index].displayName.toString()}",
                                      style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Icon",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                            abilities![index]
                                                .displayIcon
                                                .toString(),
                                          ))),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Description : ${abilities![index].description.toString()}",
                                      style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
