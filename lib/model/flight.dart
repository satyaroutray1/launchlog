import 'dart:convert';

import 'package:equatable/equatable.dart';

Flight flightFromJson(String str) => Flight.fromJson(json.decode(str));

String flightToJson(Flight data) => json.encode(data.toJson());

class Flight extends Equatable{
  final int flightNumber;
  final String missionName;
  final List<dynamic> missionId;
  final bool upcoming;
  final String launchYear;
  final int launchDateUnix;
  final DateTime launchDateUtc;
  final DateTime launchDateLocal;
  final bool isTentative;
  final String tentativeMaxPrecision;
  final bool tbd;
  final int launchWindow;
  final Rocket rocket;
  final List<dynamic> ships;
  final Telemetry telemetry;
  final LaunchSite launchSite;
  final bool launchSuccess;
  final LaunchFailureDetails launchFailureDetails;
  final Links links;
  final String details;
  final DateTime staticFireDateUtc;
  final int staticFireDateUnix;
  final Timeline timeline;
  final dynamic crew;

  Flight({
    required this.flightNumber,
    required this.missionName,
    required this.missionId,
    required this.upcoming,
    required this.launchYear,
    required this.launchDateUnix,
    required this.launchDateUtc,
    required this.launchDateLocal,
    required this.isTentative,
    required this.tentativeMaxPrecision,
    required this.tbd,
    required this.launchWindow,
    required this.rocket,
    required this.ships,
    required this.telemetry,
    required this.launchSite,
    required this.launchSuccess,
    required this.launchFailureDetails,
    required this.links,
    required this.details,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.timeline,
    required this.crew,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    flightNumber: json["flight_number"],
    missionName: json["mission_name"],
    missionId: List<dynamic>.from(json["mission_id"].map((x) => x)),
    upcoming: json["upcoming"],
    launchYear: json["launch_year"],
    launchDateUnix: json["launch_date_unix"],
    launchDateUtc: DateTime.parse(json["launch_date_utc"]),
    launchDateLocal: DateTime.parse(json["launch_date_local"]),
    isTentative: json["is_tentative"],
    tentativeMaxPrecision: json["tentative_max_precision"],
    tbd: json["tbd"],
    launchWindow: json["launch_window"],
    rocket: Rocket.fromJson(json["rocket"]),
    ships: List<dynamic>.from(json["ships"].map((x) => x)),
    telemetry: Telemetry.fromJson(json["telemetry"]),
    launchSite: LaunchSite.fromJson(json["launch_site"]),
    launchSuccess: json["launch_success"],
    launchFailureDetails: LaunchFailureDetails.fromJson(json["launch_failure_details"]),
    links: Links.fromJson(json["links"]),
    details: json["details"],
    staticFireDateUtc: DateTime.parse(json["static_fire_date_utc"]),
    staticFireDateUnix: json["static_fire_date_unix"],
    timeline: Timeline.fromJson(json["timeline"]),
    crew: json["crew"],
  );

  Map<String, dynamic> toJson() => {
    "flight_number": flightNumber,
    "mission_name": missionName,
    "mission_id": List<dynamic>.from(missionId.map((x) => x)),
    "upcoming": upcoming,
    "launch_year": launchYear,
    "launch_date_unix": launchDateUnix,
    "launch_date_utc": launchDateUtc.toIso8601String(),
    "launch_date_local": launchDateLocal.toIso8601String(),
    "is_tentative": isTentative,
    "tentative_max_precision": tentativeMaxPrecision,
    "tbd": tbd,
    "launch_window": launchWindow,
    "rocket": rocket.toJson(),
    "ships": List<dynamic>.from(ships.map((x) => x)),
    "telemetry": telemetry.toJson(),
    "launch_site": launchSite.toJson(),
    "launch_success": launchSuccess,
    "launch_failure_details": launchFailureDetails.toJson(),
    "links": links.toJson(),
    "details": details,
    "static_fire_date_utc": staticFireDateUtc.toIso8601String(),
    "static_fire_date_unix": staticFireDateUnix,
    "timeline": timeline.toJson(),
    "crew": crew,
  };

  @override
  List<Object?> get props => [
  flightNumber, missionName, missionId, upcoming, launchYear, launchDateUnix,
    launchDateUtc, launchDateLocal, isTentative, tentativeMaxPrecision, tbd,
    launchWindow, rocket, ships, telemetry, launchSite, launchSuccess,
    launchFailureDetails, links, details, staticFireDateUtc, staticFireDateUnix,
    timeline,crew
  ];
}

class LaunchFailureDetails {
  final int time;
  final dynamic altitude;
  final String reason;

  LaunchFailureDetails({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) => LaunchFailureDetails(
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

class LaunchSite {
  final String siteId;
  final String siteName;
  final String siteNameLong;

  LaunchSite({
    required this.siteId,
    required this.siteName,
    required this.siteNameLong,
  });

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
    siteId: json["site_id"],
    siteName: json["site_name"],
    siteNameLong: json["site_name_long"],
  );

  Map<String, dynamic> toJson() => {
    "site_id": siteId,
    "site_name": siteName,
    "site_name_long": siteNameLong,
  };
}

class Links {
  final String missionPatch;
  final String missionPatchSmall;
  final dynamic redditCampaign;
  final dynamic redditLaunch;
  final dynamic redditRecovery;
  final dynamic redditMedia;
  final dynamic presskit;
  final String articleLink;
  final String wikipedia;
  final String videoLink;
  final String youtubeId;
  final List<dynamic> flickrImages;

  Links({
    required this.missionPatch,
    required this.missionPatchSmall,
    required this.redditCampaign,
    required this.redditLaunch,
    required this.redditRecovery,
    required this.redditMedia,
    required this.presskit,
    required this.articleLink,
    required this.wikipedia,
    required this.videoLink,
    required this.youtubeId,
    required this.flickrImages,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    missionPatch: json["mission_patch"],
    missionPatchSmall: json["mission_patch_small"],
    redditCampaign: json["reddit_campaign"],
    redditLaunch: json["reddit_launch"],
    redditRecovery: json["reddit_recovery"],
    redditMedia: json["reddit_media"],
    presskit: json["presskit"],
    articleLink: json["article_link"],
    wikipedia: json["wikipedia"],
    videoLink: json["video_link"],
    youtubeId: json["youtube_id"],
    flickrImages: List<dynamic>.from(json["flickr_images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mission_patch": missionPatch,
    "mission_patch_small": missionPatchSmall,
    "reddit_campaign": redditCampaign,
    "reddit_launch": redditLaunch,
    "reddit_recovery": redditRecovery,
    "reddit_media": redditMedia,
    "presskit": presskit,
    "article_link": articleLink,
    "wikipedia": wikipedia,
    "video_link": videoLink,
    "youtube_id": youtubeId,
    "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
  };
}

class Rocket {
  final String rocketId;
  final String rocketName;
  final String rocketType;
  final FirstStage firstStage;
  final SecondStage secondStage;
  final Fairings fairings;

  Rocket({
    required this.rocketId,
    required this.rocketName,
    required this.rocketType,
    required this.firstStage,
    required this.secondStage,
    required this.fairings,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
    rocketId: json["rocket_id"],
    rocketName: json["rocket_name"],
    rocketType: json["rocket_type"],
    firstStage: FirstStage.fromJson(json["first_stage"]),
    secondStage: SecondStage.fromJson(json["second_stage"]),
    fairings: Fairings.fromJson(json["fairings"]),
  );

  Map<String, dynamic> toJson() => {
    "rocket_id": rocketId,
    "rocket_name": rocketName,
    "rocket_type": rocketType,
    "first_stage": firstStage.toJson(),
    "second_stage": secondStage.toJson(),
    "fairings": fairings.toJson(),
  };
}

class Fairings {
  final bool reused;
  final bool recoveryAttempt;
  final bool recovered;
  final dynamic ship;

  Fairings({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered,
    required this.ship,
  });

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
    reused: json["reused"],
    recoveryAttempt: json["recovery_attempt"],
    recovered: json["recovered"],
    ship: json["ship"],
  );

  Map<String, dynamic> toJson() => {
    "reused": reused,
    "recovery_attempt": recoveryAttempt,
    "recovered": recovered,
    "ship": ship,
  };
}

class FirstStage {
  final List<Core> cores;

  FirstStage({
    required this.cores,
  });

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
    cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
  };
}

class Core {
  final String coreSerial;
  final int flight;
  final dynamic block;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final dynamic landSuccess;
  final bool landingIntent;
  final dynamic landingType;
  final dynamic landingVehicle;

  Core({
    required this.coreSerial,
    required this.flight,
    required this.block,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landSuccess,
    required this.landingIntent,
    required this.landingType,
    required this.landingVehicle,
  });

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    coreSerial: json["core_serial"],
    flight: json["flight"],
    block: json["block"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    reused: json["reused"],
    landSuccess: json["land_success"],
    landingIntent: json["landing_intent"],
    landingType: json["landing_type"],
    landingVehicle: json["landing_vehicle"],
  );

  Map<String, dynamic> toJson() => {
    "core_serial": coreSerial,
    "flight": flight,
    "block": block,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "land_success": landSuccess,
    "landing_intent": landingIntent,
    "landing_type": landingType,
    "landing_vehicle": landingVehicle,
  };
}

class SecondStage {
  final int block;
  final List<Payload> payloads;

  SecondStage({
    required this.block,
    required this.payloads,
  });

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
    block: json["block"],
    payloads: List<Payload>.from(json["payloads"].map((x) => Payload.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "block": block,
    "payloads": List<dynamic>.from(payloads.map((x) => x.toJson())),
  };
}

class Payload {
  final String payloadId;
  final List<dynamic> noradId;
  final bool reused;
  final List<String> customers;
  final String nationality;
  final String manufacturer;
  final String payloadType;
  final int payloadMassKg;
  final int payloadMassLbs;
  final String orbit;
  final OrbitParams orbitParams;

  Payload({
    required this.payloadId,
    required this.noradId,
    required this.reused,
    required this.customers,
    required this.nationality,
    required this.manufacturer,
    required this.payloadType,
    required this.payloadMassKg,
    required this.payloadMassLbs,
    required this.orbit,
    required this.orbitParams,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    payloadId: json["payload_id"],
    noradId: List<dynamic>.from(json["norad_id"].map((x) => x)),
    reused: json["reused"],
    customers: List<String>.from(json["customers"].map((x) => x)),
    nationality: json["nationality"],
    manufacturer: json["manufacturer"],
    payloadType: json["payload_type"],
    payloadMassKg: json["payload_mass_kg"],
    payloadMassLbs: json["payload_mass_lbs"],
    orbit: json["orbit"],
    orbitParams: OrbitParams.fromJson(json["orbit_params"]),
  );

  Map<String, dynamic> toJson() => {
    "payload_id": payloadId,
    "norad_id": List<dynamic>.from(noradId.map((x) => x)),
    "reused": reused,
    "customers": List<dynamic>.from(customers.map((x) => x)),
    "nationality": nationality,
    "manufacturer": manufacturer,
    "payload_type": payloadType,
    "payload_mass_kg": payloadMassKg,
    "payload_mass_lbs": payloadMassLbs,
    "orbit": orbit,
    "orbit_params": orbitParams.toJson(),
  };
}

class OrbitParams {
  final String referenceSystem;
  final String regime;
  final dynamic longitude;
  final dynamic semiMajorAxisKm;
  final dynamic eccentricity;
  final int periapsisKm;
  final int apoapsisKm;
  final int inclinationDeg;
  final dynamic periodMin;
  final dynamic lifespanYears;
  final dynamic epoch;
  final dynamic meanMotion;
  final dynamic raan;
  final dynamic argOfPericenter;
  final dynamic meanAnomaly;

  OrbitParams({
    required this.referenceSystem,
    required this.regime,
    required this.longitude,
    required this.semiMajorAxisKm,
    required this.eccentricity,
    required this.periapsisKm,
    required this.apoapsisKm,
    required this.inclinationDeg,
    required this.periodMin,
    required this.lifespanYears,
    required this.epoch,
    required this.meanMotion,
    required this.raan,
    required this.argOfPericenter,
    required this.meanAnomaly,
  });

  factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
    referenceSystem: json["reference_system"],
    regime: json["regime"],
    longitude: json["longitude"],
    semiMajorAxisKm: json["semi_major_axis_km"],
    eccentricity: json["eccentricity"],
    periapsisKm: json["periapsis_km"],
    apoapsisKm: json["apoapsis_km"],
    inclinationDeg: json["inclination_deg"],
    periodMin: json["period_min"],
    lifespanYears: json["lifespan_years"],
    epoch: json["epoch"],
    meanMotion: json["mean_motion"],
    raan: json["raan"],
    argOfPericenter: json["arg_of_pericenter"],
    meanAnomaly: json["mean_anomaly"],
  );

  Map<String, dynamic> toJson() => {
    "reference_system": referenceSystem,
    "regime": regime,
    "longitude": longitude,
    "semi_major_axis_km": semiMajorAxisKm,
    "eccentricity": eccentricity,
    "periapsis_km": periapsisKm,
    "apoapsis_km": apoapsisKm,
    "inclination_deg": inclinationDeg,
    "period_min": periodMin,
    "lifespan_years": lifespanYears,
    "epoch": epoch,
    "mean_motion": meanMotion,
    "raan": raan,
    "arg_of_pericenter": argOfPericenter,
    "mean_anomaly": meanAnomaly,
  };
}

class Telemetry {
  final dynamic flightClub;

  Telemetry({
    required this.flightClub,
  });

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
    flightClub: json["flight_club"],
  );

  Map<String, dynamic> toJson() => {
    "flight_club": flightClub,
  };
}

class Timeline {
  final int webcastLiftoff;

  Timeline({
    required this.webcastLiftoff,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
    webcastLiftoff: json["webcast_liftoff"],
  );

  Map<String, dynamic> toJson() => {
    "webcast_liftoff": webcastLiftoff,
  };
}
