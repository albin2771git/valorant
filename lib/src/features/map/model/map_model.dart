// To parse this JSON data, do
//
//     final mapModel = mapModelFromJson(jsonString);

import 'dart:convert';

MapModel mapModelFromJson(String str) => MapModel.fromJson(json.decode(str));

String mapModelToJson(MapModel data) => json.encode(data.toJson());

class MapModel {
    MapModel({
        this.status,
        this.data,
    });

    int? status;
    List<Datum>? data;

    factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
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
        this.coordinates,
        this.displayIcon,
        this.listViewIcon,
        this.splash,
        this.assetPath,
        this.mapUrl,
        this.xMultiplier,
        this.yMultiplier,
        this.xScalarToAdd,
        this.yScalarToAdd,
        this.callouts,
    });

    String? uuid;
    String? displayName;
    String? coordinates;
    String? displayIcon;
    String? listViewIcon;
    String? splash;
    String? assetPath;
    String? mapUrl;
    double? xMultiplier;
    double? yMultiplier;
    double? xScalarToAdd;
    double? yScalarToAdd;
    List<Callout>? callouts;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: json["callouts"] == null ? [] : List<Callout>.from(json["callouts"]!.map((x) => Callout.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null ? [] : List<dynamic>.from(callouts!.map((x) => x.toJson())),
    };
}

class Callout {
    Callout({
        this.regionName,
        this.superRegionName,
        this.location,
    });

    String? regionName;
    SuperRegionName? superRegionName;
    Location? location;

    factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: superRegionNameValues.map[json["superRegionName"]]!,
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionNameValues.reverse[superRegionName],
        "location": location?.toJson(),
    };
}

class Location {
    Location({
        this.x,
        this.y,
    });

    double? x;
    double? y;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}

enum SuperRegionName { A, ATTACKER_SIDE, B, MID, DEFENDER_SIDE, C }

final superRegionNameValues = EnumValues({
    "A": SuperRegionName.A,
    "Attacker Side": SuperRegionName.ATTACKER_SIDE,
    "B": SuperRegionName.B,
    "C": SuperRegionName.C,
    "Defender Side": SuperRegionName.DEFENDER_SIDE,
    "Mid": SuperRegionName.MID
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
