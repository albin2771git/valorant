import 'package:flutter/material.dart';
import 'package:valorant/src/core/constants/app_colors.dart';

class AgentDetailPage extends StatelessWidget {
  final String networkimg;
  final String avatarimg;
  final String name;
  const AgentDetailPage(
      {super.key,
      required this.networkimg,
      required this.avatarimg,
      required this.name});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: _size.width,
        height: _size.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Container(
                width: _size.width,
                height: _size.height * 0.60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Stack(children: [
                  Container(
                    width: _size.width,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: NetworkImage(networkimg), fit: BoxFit.cover),
                            gradient: LinearGradient(colors: [Color(0xff)]),
                        borderRadius: BorderRadius.circular(12)),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
