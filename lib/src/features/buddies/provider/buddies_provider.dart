import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../model/buddies_model.dart';

final buddiesapidataProvider = FutureProvider<BuddiesModel>((ref) async {
  String endpoint = "https://valorant-api.com/v1/buddies";

  Response res = await get(Uri.parse(endpoint));
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body.toString());
    return BuddiesModel.fromJson(result);
  } else {
    throw Exception(res.reasonPhrase);
  }
});
