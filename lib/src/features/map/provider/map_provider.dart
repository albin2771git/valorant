import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../model/map_model.dart';

final mapProvider = FutureProvider<MapModel>((ref) async {
  String endpoint = "https://valorant-api.com/v1/maps";

  Response res = await get(Uri.parse(endpoint));
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body.toString());

    return MapModel.fromJson(result);
  } else {
    throw Exception(res.reasonPhrase);
  }
});
