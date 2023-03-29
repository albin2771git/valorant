import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../model/bundle_model.dart';

final apidataProviderbundle = FutureProvider<BundleModel>((ref) async {
  String endpoint = "https://valorant-api.com/v1/bundles";

  Response res = await get(Uri.parse(endpoint));
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body.toString());
    return BundleModel.fromJson(result);
  } else {
    throw Exception(res.reasonPhrase);
  }
});
