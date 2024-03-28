// To parse this JSON data, do
//
//     final searchPhotosModel = searchPhotosModelFromJson(jsonString);

import 'dart:convert';

import 'package:exam_demo_unsplash/models/collection_model.dart';
import 'package:exam_demo_unsplash/models/url_model.dart';

SearchPhotosModel searchPhotosModelFromJson(String str) =>
    SearchPhotosModel.fromJson(json.decode(str));

String searchPhotosModelToJson(SearchPhotosModel data) =>
    json.encode(data.toJson());

List<Result> photosResModelFromJson(String str) =>
    List<Result>.from(json.decode(str).map((x) => Result.fromJson(x)));

class SearchPhotosModel {
  int total;
  int totalPages;
  List<Result> results;

  SearchPhotosModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchPhotosModel.fromJson(Map<String, dynamic> json) =>
      SearchPhotosModel(
        total: json["total"],
        totalPages: json["total_pages"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

PreviewPhoto getPreviewPhoto(Result result) {
  var photo = PreviewPhoto(
    id: result.id,
    slug: result.slug,
    createdAt: result.createdAt,
    updatedAt: result.updatedAt,
    blurHash: result.blurHash!,
    links: result.links,
    urls: result.urls,
  );
  photo.descriptions = result.description;
  photo.user = result.user.name;
  return photo;
}

class Result {
  String id;
  String slug;
  AlternativeSlugs alternativeSlugs;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String? blurHash;
  String? description;
  String? altDescription;
  List<Breadcrumb> breadcrumbs;
  Urls urls;
  ResultLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  ResultTopicSubmissions topicSubmissions;
  AssetType assetType;
  User user;

  Result({
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    this.blurHash,
    required this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.assetType,
    required this.user,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        slug: json["slug"],
        alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<Breadcrumb>.from(
            json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        urls: Urls.fromMap(json["urls"]),
        links: ResultLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions:
            ResultTopicSubmissions.fromJson(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]]!,
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "alternative_slugs": alternativeSlugs.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toJson())),
        "urls": urls.toMap(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "asset_type": assetTypeValues.reverse[assetType],
        "user": user.toJson(),
      };
}

class AlternativeSlugs {
  String? en;
  String? es;
  String? ja;
  String? fr;
  String? it;
  String? ko;
  String? de;
  String? pt;

  AlternativeSlugs({
    required this.en,
    required this.es,
    required this.ja,
    required this.fr,
    required this.it,
    required this.ko,
    required this.de,
    required this.pt,
  });

  factory AlternativeSlugs.fromJson(Map<String, dynamic> json) =>
      AlternativeSlugs(
        en: json["en"],
        es: json["es"],
        ja: json["ja"],
        fr: json["fr"],
        it: json["it"],
        ko: json["ko"],
        de: json["de"],
        pt: json["pt"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "es": es,
        "ja": ja,
        "fr": fr,
        "it": it,
        "ko": ko,
        "de": de,
        "pt": pt,
      };
}

enum AssetType { PHOTO }

final assetTypeValues = EnumValues({"photo": AssetType.PHOTO});

class Breadcrumb {
  String slug;
  String title;
  int index;
  TypeEnum type;

  Breadcrumb({
    required this.slug,
    required this.title,
    required this.index,
    required this.type,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        slug: json["slug"],
        title: json["title"],
        index: json["index"],
        type: typeEnumValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "index": index,
        "type": typeEnumValues.reverse[type],
      };
}

enum TypeEnum { LANDING_PAGE, SEARCH }

final typeEnumValues = EnumValues(
    {"landing_page": TypeEnum.LANDING_PAGE, "search": TypeEnum.SEARCH});

class ResultLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  ResultLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Source {
  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  CoverPhoto coverPhoto;

  Source({
    required this.ancestry,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.coverPhoto,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        ancestry: Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
      );

  Map<String, dynamic> toJson() => {
        "ancestry": ancestry.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto.toJson(),
      };
}

class Ancestry {
  TypeClass type;
  TypeClass? category;
  TypeClass? subcategory;

  Ancestry({
    required this.type,
    this.category,
    this.subcategory,
  });

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: TypeClass.fromJson(json["type"]),
        category: json["category"] == null
            ? null
            : TypeClass.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : TypeClass.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
        "category": category?.toJson(),
        "subcategory": subcategory?.toJson(),
      };
}

class TypeClass {
  String slug;
  String prettySlug;

  TypeClass({
    required this.slug,
    required this.prettySlug,
  });

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

class CoverPhoto {
  String id;
  String slug;
  AlternativeSlugs alternativeSlugs;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  List<Breadcrumb> breadcrumbs;
  Urls urls;
  ResultLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  CoverPhotoTopicSubmissions topicSubmissions;
  AssetType? assetType;
  bool? premium;
  bool? plus;
  User user;

  CoverPhoto({
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.assetType,
    required this.premium,
    required this.plus,
    required this.user,
  });

  factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
        id: json["id"],
        slug: json["slug"],
        alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<Breadcrumb>.from(
            json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        urls: Urls.fromMap(json["urls"]),
        links: ResultLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions:
            CoverPhotoTopicSubmissions.fromJson(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]],
        premium: json["premium"],
        plus: json["plus"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "alternative_slugs": alternativeSlugs.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toJson())),
        "urls": urls.toMap(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "asset_type": assetTypeValues.reverse[assetType],
        "premium": premium,
        "plus": plus,
        "user": user.toJson(),
      };
}

class CoverPhotoTopicSubmissions {
  ArchitectureInterior? architectureInterior;
  ArchitectureInterior? wallpapers;
  ArchitectureInterior? colorOfWater;
  ArchitectureInterior? interiors;
  ArchitectureInterior? nature;
  ArchitectureInterior? travel;

  CoverPhotoTopicSubmissions({
    this.architectureInterior,
    this.wallpapers,
    this.colorOfWater,
    this.interiors,
    this.nature,
    this.travel,
  });

  factory CoverPhotoTopicSubmissions.fromJson(Map<String, dynamic> json) =>
      CoverPhotoTopicSubmissions(
        architectureInterior: json["architecture-interior"] == null
            ? null
            : ArchitectureInterior.fromJson(json["architecture-interior"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : ArchitectureInterior.fromJson(json["wallpapers"]),
        colorOfWater: json["color-of-water"] == null
            ? null
            : ArchitectureInterior.fromJson(json["color-of-water"]),
        interiors: json["interiors"] == null
            ? null
            : ArchitectureInterior.fromJson(json["interiors"]),
        nature: json["nature"] == null
            ? null
            : ArchitectureInterior.fromJson(json["nature"]),
        travel: json["travel"] == null
            ? null
            : ArchitectureInterior.fromJson(json["travel"]),
      );

  Map<String, dynamic> toJson() => {
        "architecture-interior": architectureInterior?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "color-of-water": colorOfWater?.toJson(),
        "interiors": interiors?.toJson(),
        "nature": nature?.toJson(),
        "travel": travel?.toJson(),
      };
}

class ArchitectureInterior {
  Status? status;
  DateTime? approvedOn;

  ArchitectureInterior({
    this.status,
    this.approvedOn,
  });

  factory ArchitectureInterior.fromJson(Map<String?, dynamic> json) =>
      ArchitectureInterior(
          //status: statusValues.map[json["status"]]!,
          //approvedOn: DateTime.parse(json["approved_on"]),
          );

  Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn?.toIso8601String(),
      };
}

enum Status { APPROVED }

final statusValues = EnumValues({"approved": Status.APPROVED});

class User {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks links;
  ProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  int totalPromotedPhotos;
  bool acceptedTos;
  bool forHire;
  Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalPromotedPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        totalPromotedPhotos: json["total_promoted_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_promoted_photos": totalPromotedPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
      };
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
    required this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
      };
}

class ResultTopicSubmissions {
  ArchitectureInterior? businessWork;
  ArchitectureInterior? currentEvents;
  ArchitectureInterior? interiors;
  ArchitectureInterior? wallpapers;
  ArchitectureInterior? architectureInterior;

  ResultTopicSubmissions({
    this.businessWork,
    this.currentEvents,
    this.interiors,
    this.wallpapers,
    this.architectureInterior,
  });

  factory ResultTopicSubmissions.fromJson(Map<String, dynamic> json) =>
      ResultTopicSubmissions(
        businessWork: json["business-work"] == null
            ? null
            : ArchitectureInterior.fromJson(json["business-work"]),
        currentEvents: json["current-events"] == null
            ? null
            : ArchitectureInterior.fromJson(json["current-events"]),
        interiors: json["interiors"] == null
            ? null
            : ArchitectureInterior.fromJson(json["interiors"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : ArchitectureInterior.fromJson(json["wallpapers"]),
        architectureInterior: json["architecture-interior"] == null
            ? null
            : ArchitectureInterior.fromJson(json["architecture-interior"]),
      );

  Map<String, dynamic> toJson() => {
        "business-work": businessWork?.toJson(),
        "current-events": currentEvents?.toJson(),
        "interiors": interiors?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "architecture-interior": architectureInterior?.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
