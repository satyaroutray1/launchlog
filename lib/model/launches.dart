import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Launches> launchesFromJson(String str) => List<Launches>.from(json.decode(str).map((x) => Launches.fromJson(x)));

String launchesToJson(List<Launches> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Launches extends Equatable{
  final Fairings? fairings;
  final Links links;
  final DateTime? staticFireDateUtc;
  final int? staticFireDateUnix;
  final bool net;
  final int? window;
  final Rocket rocket;
  final bool success;
  final List<Failure> failures;
  final String? details;
  final List<String> crew;
  final List<String> ships;
  final List<String> capsules;
  final List<String> payloads;
  final Launchpad launchpad;
  final int flightNumber;
  final String name;
  final DateTime dateUtc;
  final int dateUnix;
  final DateTime dateLocal;
  final DatePrecision datePrecision;
  final bool upcoming;
  final List<Core> cores;
  final bool autoUpdate;
  final bool tbd;
  final String? launchLibraryId;
  final String id;

  const Launches({
    required this.fairings,
    required this.links,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.net,
    required this.window,
    required this.rocket,
    required this.success,
    required this.failures,
    required this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    required this.launchpad,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.upcoming,
    required this.cores,
    required this.autoUpdate,
    required this.tbd,
    required this.launchLibraryId,
    required this.id,
  });

  factory Launches.fromJson(Map<String, dynamic> json) => Launches(
    fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
    links: Links.fromJson(json["links"]),
    staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
    staticFireDateUnix: json["static_fire_date_unix"],
    net: json["net"],
    window: json["window"],
    rocket: rocketValues.map[json["rocket"]]!,
    success: json["success"],
    failures: List<Failure>.from(json["failures"].map((x) => Failure.fromJson(x))),
    details: json["details"],
    crew: List<String>.from(json["crew"].map((x) => x)),
    ships: List<String>.from(json["ships"].map((x) => x)),
    capsules: List<String>.from(json["capsules"].map((x) => x)),
    payloads: List<String>.from(json["payloads"].map((x) => x)),
    launchpad: launchpadValues.map[json["launchpad"]]!,
    flightNumber: json["flight_number"],
    name: json["name"],
    dateUtc: DateTime.parse(json["date_utc"]),
    dateUnix: json["date_unix"],
    dateLocal: DateTime.parse(json["date_local"]),
    datePrecision: datePrecisionValues.map[json["date_precision"]]!,
    upcoming: json["upcoming"],
    cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
    autoUpdate: json["auto_update"],
    tbd: json["tbd"],
    launchLibraryId: json["launch_library_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "fairings": fairings?.toJson(),
    "links": links.toJson(),
    "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
    "static_fire_date_unix": staticFireDateUnix,
    "net": net,
    "window": window,
    "rocket": rocketValues.reverse[rocket],
    "success": success,
    "failures": List<dynamic>.from(failures.map((x) => x.toJson())),
    "details": details,
    "crew": List<dynamic>.from(crew.map((x) => x)),
    "ships": List<dynamic>.from(ships.map((x) => x)),
    "capsules": List<dynamic>.from(capsules.map((x) => x)),
    "payloads": List<dynamic>.from(payloads.map((x) => x)),
    "launchpad": launchpadValues.reverse[launchpad],
    "flight_number": flightNumber,
    "name": name,
    "date_utc": dateUtc.toIso8601String(),
    "date_unix": dateUnix,
    "date_local": dateLocal.toIso8601String(),
    "date_precision": datePrecisionValues.reverse[datePrecision],
    "upcoming": upcoming,
    "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
    "auto_update": autoUpdate,
    "tbd": tbd,
    "launch_library_id": launchLibraryId,
    "id": id,
  };

  @override
  List<Object?> get props => [
  fairings, links, staticFireDateUtc, staticFireDateUnix, net, window,
  rocket, success, failures, details, crew, ships, capsules, payloads, launchpad,
  flightNumber, name, dateUtc, dateUnix, dateLocal, datePrecision, upcoming,
  cores, autoUpdate, tbd, launchLibraryId, id
  ];
}

class Core {
  final String? core;
  final int? flight;
  final bool? gridfins;
  final bool? legs;
  final bool? reused;
  final bool? landingAttempt;
  final bool? landingSuccess;
  final LandingType? landingType;
  final Landpad? landpad;

  Core({
    required this.core,
    required this.flight,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landingAttempt,
    required this.landingSuccess,
    required this.landingType,
    required this.landpad,
  });

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    core: json["core"],
    flight: json["flight"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    reused: json["reused"],
    landingAttempt: json["landing_attempt"],
    landingSuccess: json["landing_success"],
    landingType: landingTypeValues.map[json["landing_type"]],
    landpad: landpadValues.map[json["landpad"]],
  );

  Map<String, dynamic> toJson() => {
    "core": core,
    "flight": flight,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "landing_attempt": landingAttempt,
    "landing_success": landingSuccess,
    "landing_type": landingTypeValues.reverse[landingType],
    "landpad": landpadValues.reverse[landpad],
  };
}

enum LandingType {
  ASDS,
  OCEAN,
  RTLS
}

final landingTypeValues = EnumValues({
  "ASDS": LandingType.ASDS,
  "Ocean": LandingType.OCEAN,
  "RTLS": LandingType.RTLS
});

enum Landpad {
  THE_5_E9_E3032383_ECB267_A34_E7_C7,
  THE_5_E9_E3032383_ECB554034_E7_C9,
  THE_5_E9_E3032383_ECB6_BB234_E7_CA,
  THE_5_E9_E3032383_ECB761634_E7_CB,
  THE_5_E9_E3032383_ECB90_A834_E7_C8,
  THE_5_E9_E3033383_ECB075134_E7_CD,
  THE_5_E9_E3033383_ECBB9_E534_E7_CC
}

final landpadValues = EnumValues({
  "5e9e3032383ecb267a34e7c7": Landpad.THE_5_E9_E3032383_ECB267_A34_E7_C7,
  "5e9e3032383ecb554034e7c9": Landpad.THE_5_E9_E3032383_ECB554034_E7_C9,
  "5e9e3032383ecb6bb234e7ca": Landpad.THE_5_E9_E3032383_ECB6_BB234_E7_CA,
  "5e9e3032383ecb761634e7cb": Landpad.THE_5_E9_E3032383_ECB761634_E7_CB,
  "5e9e3032383ecb90a834e7c8": Landpad.THE_5_E9_E3032383_ECB90_A834_E7_C8,
  "5e9e3033383ecb075134e7cd": Landpad.THE_5_E9_E3033383_ECB075134_E7_CD,
  "5e9e3033383ecbb9e534e7cc": Landpad.THE_5_E9_E3033383_ECBB9_E534_E7_CC
});

enum DatePrecision {
  DAY,
  HOUR,
  MONTH
}

final datePrecisionValues = EnumValues({
  "day": DatePrecision.DAY,
  "hour": DatePrecision.HOUR,
  "month": DatePrecision.MONTH
});

class Failure {
  final int time;
  final int? altitude;
  final String reason;

  Failure({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
    time: json["time"],
    altitude: json["altitude"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "altitude": altitude,
    "reason": reason,
  };
}

class Fairings {
  final bool reused;
  final bool? recoveryAttempt;
  final bool? recovered;
  final List<String> ships;

  Fairings({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered,
    required this.ships,
  });

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
    reused: json["reused"],
    recoveryAttempt: json["recovery_attempt"],
    recovered: json["recovered"],
    ships: List<String>.from(json["ships"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "reused": reused,
    "recovery_attempt": recoveryAttempt,
    "recovered": recovered,
    "ships": List<dynamic>.from(ships.map((x) => x)),
  };
}

enum Launchpad {
  THE_5_E9_E4501_F509094_BA4566_F84,
  THE_5_E9_E4502_F509092_B78566_F87,
  THE_5_E9_E4502_F509094188566_F88,
  THE_5_E9_E4502_F5090995_DE566_F86
}

final launchpadValues = EnumValues({
  "5e9e4501f509094ba4566f84": Launchpad.THE_5_E9_E4501_F509094_BA4566_F84,
  "5e9e4502f509092b78566f87": Launchpad.THE_5_E9_E4502_F509092_B78566_F87,
  "5e9e4502f509094188566f88": Launchpad.THE_5_E9_E4502_F509094188566_F88,
  "5e9e4502f5090995de566f86": Launchpad.THE_5_E9_E4502_F5090995_DE566_F86
});

class Links {
  final Patch patch;
  final Reddit reddit;
  final Flickr flickr;
  final String? presskit;
  final String? webcast;
  final String? youtubeId;
  final String? article;
  final String? wikipedia;

  Links({
    required this.patch,
    required this.reddit,
    required this.flickr,
    required this.presskit,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    patch: Patch.fromJson(json["patch"]),
    reddit: Reddit.fromJson(json["reddit"]),
    flickr: Flickr.fromJson(json["flickr"]),
    presskit: json["presskit"],
    webcast: json["webcast"],
    youtubeId: json["youtube_id"],
    article: json["article"],
    wikipedia: json["wikipedia"],
  );

  Map<String, dynamic> toJson() => {
    "patch": patch.toJson(),
    "reddit": reddit.toJson(),
    "flickr": flickr.toJson(),
    "presskit": presskit,
    "webcast": webcast,
    "youtube_id": youtubeId,
    "article": article,
    "wikipedia": wikipedia,
  };
}

class Flickr {
  final List<dynamic> small;
  final List<String> original;

  Flickr({
    required this.small,
    required this.original,
  });

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
    small: List<dynamic>.from(json["small"].map((x) => x)),
    original: List<String>.from(json["original"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "small": List<dynamic>.from(small.map((x) => x)),
    "original": List<dynamic>.from(original.map((x) => x)),
  };
}

class Patch {
  final String? small;
  final String? large;

  Patch({
    required this.small,
    required this.large,
  });

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
    small: json["small"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "large": large,
  };
}

class Reddit {
  final String? campaign;
  final String? launch;
  final String? media;
  final String? recovery;

  Reddit({
    required this.campaign,
    required this.launch,
    required this.media,
    required this.recovery,
  });

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
    campaign: json["campaign"],
    launch: json["launch"],
    media: json["media"],
    recovery: json["recovery"],
  );

  Map<String, dynamic> toJson() => {
    "campaign": campaign,
    "launch": launch,
    "media": media,
    "recovery": recovery,
  };
}

enum Rocket {
  THE_5_E9_D0_D95_EDA69955_F709_D1_EB,
  THE_5_E9_D0_D95_EDA69973_A809_D1_EC,
  THE_5_E9_D0_D95_EDA69974_DB09_D1_ED
}

final rocketValues = EnumValues({
  "5e9d0d95eda69955f709d1eb": Rocket.THE_5_E9_D0_D95_EDA69955_F709_D1_EB,
  "5e9d0d95eda69973a809d1ec": Rocket.THE_5_E9_D0_D95_EDA69973_A809_D1_EC,
  "5e9d0d95eda69974db09d1ed": Rocket.THE_5_E9_D0_D95_EDA69974_DB09_D1_ED
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
