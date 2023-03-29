// To parse this JSON data, do
//
//     final bundleModel = bundleModelFromJson(jsonString);

import 'dart:convert';

BundleModel bundleModelFromJson(String str) => BundleModel.fromJson(json.decode(str));

String bundleModelToJson(BundleModel data) => json.encode(data.toJson());

class BundleModel {
    BundleModel({
        this.status,
        this.data,
    });

    int? status;
    List<Datum>? data;

    factory BundleModel.fromJson(Map<String, dynamic> json) => BundleModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.uuid,
        this.displayName,
        this.displayNameSubText,
        this.description,
        this.extraDescription,
        this.promoDescription,
        this.useAdditionalContext,
        this.displayIcon,
        this.displayIcon2,
        this.verticalPromoImage,
        this.assetPath,
    });

    String? uuid;
    String? displayName;
    dynamic displayNameSubText;
    String? description;
    String? extraDescription;
    String? promoDescription;
    bool? useAdditionalContext;
    String? displayIcon;
    String? displayIcon2;
    String? verticalPromoImage;
    String? assetPath;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayNameSubText: json["displayNameSubText"],
        description: json["description"],
        extraDescription: json["extraDescription"],
        promoDescription: json["promoDescription"],
        useAdditionalContext: json["useAdditionalContext"],
        displayIcon: json["displayIcon"],
        displayIcon2: json["displayIcon2"],
        verticalPromoImage: json["verticalPromoImage"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayNameSubText": displayNameSubText,
        "description": description,
        "extraDescription": extraDescription,
        "promoDescription": promoDescription,
        "useAdditionalContext": useAdditionalContext,
        "displayIcon": displayIcon,
        "displayIcon2": displayIcon2,
        "verticalPromoImage": verticalPromoImage,
        "assetPath": assetPath,
    };
}
