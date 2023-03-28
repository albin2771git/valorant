import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:valorant/src/features/agent/model/agent_model.dart';
import 'package:valorant/src/features/splash_screen.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    ),
  ));
}

final apidataProvider = FutureProvider<AgentModel>((ref) async {
  String endpoint =
      "https://valorant-api.com/v1/agents?isPlayableCharacter=true";

  Response res = await get(Uri.parse(endpoint));
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body.toString());
    return AgentModel.fromJson(result);
  } else {
    throw Exception(res.reasonPhrase);
  }
});
