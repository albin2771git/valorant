import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:valorant/src/features/weapon/models/weapon_model.dart';

final weaponProvider = FutureProvider<WeaponModel>((ref) async {
  String endpoint = "https://valorant-api.com/v1/weapons";

  Response res = await get(Uri.parse(endpoint));
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body.toString());

    return WeaponModel.fromJson(result);
  } else {
    print("blhkjg");
    throw Exception(res.reasonPhrase);
  }
});
