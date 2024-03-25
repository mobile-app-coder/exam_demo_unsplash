// To parse this JSON data, do
//
//     final collectionModel = collectionModelFromMap(jsonString);

import 'dart:convert';

import 'package:exam_demo_unsplash/models/search_response_model.dart';
import 'package:exam_demo_unsplash/models/url_model.dart';

List<CollectionModel> collectionModelFromMap(String str) =>
    List<CollectionModel>.from(
        json.decode(str).map((x) => CollectionModel.fromMap(x)));

String collectionModelToMap(List<CollectionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CollectionModel {
  String id;
  String title;
  String? description;
  DateTime publishedAt;
  DateTime lastCollectedAt;
  DateTime updatedAt;
  bool featured;
  int totalPhotos;
  bool private;
  String shareKey;
  List<Tag> tags;
  CollectionModelLinks links;
  User user;
  CollectionModelCoverPhoto coverPhoto;
  List<PreviewPhoto> previewPhotos;

  CollectionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    required this.featured,
    required this.totalPhotos,
    required this.private,
    required this.shareKey,
    required this.tags,
    required this.links,
    required this.user,
    required this.coverPhoto,
    required this.previewPhotos,
  });

  factory CollectionModel.fromMap(Map<String, dynamic> json) => CollectionModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        publishedAt: DateTime.parse(json["published_at"]),
        lastCollectedAt: DateTime.parse(json["last_collected_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        private: json["private"],
        shareKey: json["share_key"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
        links: CollectionModelLinks.fromMap(json["links"]),
        user: User.fromMap(json["user"]),
        coverPhoto: CollectionModelCoverPhoto.fromMap(json["cover_photo"]),
        previewPhotos: List<PreviewPhoto>.from(
            json["preview_photos"].map((x) => PreviewPhoto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "published_at": publishedAt.toIso8601String(),
        "last_collected_at": lastCollectedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "featured": featured,
        "total_photos": totalPhotos,
        "private": private,
        "share_key": shareKey,
        "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
        "links": links.toMap(),
        "user": user.toMap(),
        "cover_photo": coverPhoto.toMap(),
        "preview_photos":
            List<dynamic>.from(previewPhotos.map((x) => x.toMap())),
      };
}

class CollectionModelCoverPhoto {
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
  List<dynamic> breadcrumbs;
  Urls urls;
  CoverPhotoLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  PurpleTopicSubmissions topicSubmissions;
  AssetType assetType;
  User user;

  CollectionModelCoverPhoto({
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
    required this.user,
  });

  factory CollectionModelCoverPhoto.fromMap(Map<String, dynamic> json) =>
      CollectionModelCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        alternativeSlugs: AlternativeSlugs.fromMap(json["alternative_slugs"]),
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
        breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
        urls: Urls.fromMap(json["urls"]),
        links: CoverPhotoLinks.fromMap(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions:
            PurpleTopicSubmissions.fromMap(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]]!,
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "alternative_slugs": alternativeSlugs.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
        "urls": urls.toMap(),
        "links": links.toMap(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toMap(),
        "asset_type": assetTypeValues.reverse[assetType],
        "user": user.toMap(),
      };
}

class AlternativeSlugs {
  String en;
  String? es;
  String? ja;
  String? fr;
  String? it;
  String? ko;
  String? de;
  String? pt;

  AlternativeSlugs({
    required this.en,
    this.es,
    this.ja,
    this.fr,
    this.it,
    this.ko,
    this.de,
    this.pt,
  });

  factory AlternativeSlugs.fromMap(Map<String, dynamic> json) =>
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

  Map<String, dynamic> toMap() => {
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

class CoverPhotoLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  CoverPhotoLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory CoverPhotoLinks.fromMap(Map<String, dynamic> json) => CoverPhotoLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class PurpleTopicSubmissions {
  The3DRenders? experimental;
  The3DRenders? nature;
  The3DRenders? the3DRenders;
  CoolTones? wallpapers;
  CoolTones? texturesPatterns;
  CoolTones? coolTones;
  The3DRenders? fashionBeauty;
  The3DRenders? health;

  PurpleTopicSubmissions({
    this.experimental,
    this.nature,
    this.the3DRenders,
    this.wallpapers,
    this.texturesPatterns,
    this.coolTones,
    this.fashionBeauty,
    this.health,
  });

  factory PurpleTopicSubmissions.fromMap(Map<String, dynamic> json) =>
      PurpleTopicSubmissions(
        experimental: json["experimental"] == null
            ? null
            : The3DRenders.fromMap(json["experimental"]),
        nature: json["nature"] == null
            ? null
            : The3DRenders.fromMap(json["nature"]),
        the3DRenders: json["3d-renders"] == null
            ? null
            : The3DRenders.fromMap(json["3d-renders"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : CoolTones.fromMap(json["wallpapers"]),
        texturesPatterns: json["textures-patterns"] == null
            ? null
            : CoolTones.fromMap(json["textures-patterns"]),
        coolTones: json["cool-tones"] == null
            ? null
            : CoolTones.fromMap(json["cool-tones"]),
        fashionBeauty: json["fashion-beauty"] == null
            ? null
            : The3DRenders.fromMap(json["fashion-beauty"]),
        health: json["health"] == null
            ? null
            : The3DRenders.fromMap(json["health"]),
      );

  Map<String, dynamic> toMap() => {
        "experimental": experimental?.toMap(),
        "nature": nature?.toMap(),
        "3d-renders": the3DRenders?.toMap(),
        "wallpapers": wallpapers?.toMap(),
        "textures-patterns": texturesPatterns?.toMap(),
        "cool-tones": coolTones?.toMap(),
        "fashion-beauty": fashionBeauty?.toMap(),
        "health": health?.toMap(),
      };
}

class CoolTones {
  Status status;

  CoolTones({
    required this.status,
  });

  factory CoolTones.fromMap(Map<String, dynamic> json) => CoolTones(
        status: statusValues.map[json["status"]]!,
      );

  Map<String, dynamic> toMap() => {
        "status": statusValues.reverse[status],
      };
}

enum Status { APPROVED, REJECTED }

final statusValues =
    EnumValues({"approved": Status.APPROVED, "rejected": Status.REJECTED});

class The3DRenders {
  Status status;
  DateTime? approvedOn;

  The3DRenders({
    required this.status,
    this.approvedOn,
  });

  factory The3DRenders.fromMap(Map<String, dynamic> json) => The3DRenders(
        status: statusValues.map[json["status"]]!,
        approvedOn: json["approved_on"] == null
            ? null
            : DateTime.parse(json["approved_on"]),
      );

  Map<String, dynamic> toMap() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn?.toIso8601String(),
      };
}

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

  factory User.fromMap(Map<String, dynamic> json) => User(
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
        links: UserLinks.fromMap(json["links"]),
        profileImage: ProfileImage.fromMap(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        totalPromotedPhotos: json["total_promoted_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromMap(json["social"]),
      );

  Map<String, dynamic> toMap() => {
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
        "links": links.toMap(),
        "profile_image": profileImage.toMap(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_promoted_photos": totalPromotedPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toMap(),
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

  factory UserLinks.fromMap(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toMap() => {
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

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toMap() => {
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

  factory Social.fromMap(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toMap() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
      };
}

class CollectionModelLinks {
  String self;
  String html;
  String photos;
  String related;

  CollectionModelLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.related,
  });

  factory CollectionModelLinks.fromMap(Map<String, dynamic> json) =>
      CollectionModelLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        related: json["related"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
        "html": html,
        "photos": photos,
        "related": related,
      };
}

class PreviewPhoto {
  String? title = "";
  String? descriptions = "";
  String? user = "";

  String id;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  String blurHash;
  AssetType? assetType;
  Urls urls;
  ResultLinks? links;

  PreviewPhoto({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.blurHash,
    this.assetType,
    required this.urls,
    this.links,
  });

  factory PreviewPhoto.fromMap(Map<String, dynamic> json) => PreviewPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        blurHash: json["blur_hash"],
        assetType: assetTypeValues.map[json["asset_type"]]!,
        urls: Urls.fromMap(json["urls"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "blur_hash": blurHash,
        "asset_type": assetTypeValues.reverse[assetType],
        "urls": urls.toMap(),
      };
}

class Tag {
  TypeEnum type;
  String title;
  Source? source;

  Tag({
    required this.type,
    required this.title,
    this.source,
  });

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        type: typeEnumValues.map[json["type"]]!,
        title: json["title"],
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
      );

  Map<String, dynamic> toMap() => {
        "type": typeEnumValues.reverse[type],
        "title": title,
        "source": source?.toMap(),
      };
}

class Source {
  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  SourceCoverPhoto coverPhoto;

  Source({
    required this.ancestry,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.coverPhoto,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        ancestry: Ancestry.fromMap(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: SourceCoverPhoto.fromMap(json["cover_photo"]),
      );

  Map<String, dynamic> toMap() => {
        "ancestry": ancestry.toMap(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto.toMap(),
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

  factory Ancestry.fromMap(Map<String, dynamic> json) => Ancestry(
        type: TypeClass.fromMap(json["type"]),
        category: json["category"] == null
            ? null
            : TypeClass.fromMap(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : TypeClass.fromMap(json["subcategory"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type.toMap(),
        "category": category?.toMap(),
        "subcategory": subcategory?.toMap(),
      };
}

class TypeClass {
  String slug;
  String prettySlug;

  TypeClass({
    required this.slug,
    required this.prettySlug,
  });

  factory TypeClass.fromMap(Map<String, dynamic> json) => TypeClass(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
      );

  Map<String, dynamic> toMap() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

class SourceCoverPhoto {
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
  CoverPhotoLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  FluffyTopicSubmissions topicSubmissions;
  AssetType? assetType;
  bool? premium;
  bool? plus;
  User user;

  SourceCoverPhoto({
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
    this.assetType,
    this.premium,
    this.plus,
    required this.user,
  });

  factory SourceCoverPhoto.fromMap(Map<String, dynamic> json) =>
      SourceCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        alternativeSlugs: AlternativeSlugs.fromMap(json["alternative_slugs"]),
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
            json["breadcrumbs"].map((x) => Breadcrumb.fromMap(x))),
        urls: Urls.fromMap(json["urls"]),
        links: CoverPhotoLinks.fromMap(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions:
            FluffyTopicSubmissions.fromMap(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]],
        premium: json["premium"],
        plus: json["plus"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "alternative_slugs": alternativeSlugs.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toMap())),
        "urls": urls.toMap(),
        "links": links.toMap(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toMap(),
        "asset_type": assetTypeValues.reverse[assetType],
        "premium": premium,
        "plus": plus,
        "user": user.toMap(),
      };
}

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

  factory Breadcrumb.fromMap(Map<String, dynamic> json) => Breadcrumb(
        slug: json["slug"],
        title: json["title"],
        index: json["index"],
        type: typeEnumValues.map[json["type"]]!,
      );

  Map<String, dynamic> toMap() => {
        "slug": slug,
        "title": title,
        "index": index,
        "type": typeEnumValues.reverse[type],
      };
}

enum TypeEnum { LANDING_PAGE, SEARCH }

final typeEnumValues = EnumValues(
    {"landing_page": TypeEnum.LANDING_PAGE, "search": TypeEnum.SEARCH});

class FluffyTopicSubmissions {
  The3DRenders? animals;
  The3DRenders? health;
  The3DRenders? nature;
  The3DRenders? wallpapers;
  The3DRenders? architectureInterior;
  The3DRenders? colorOfWater;
  The3DRenders? currentEvents;
  The3DRenders? spirituality;
  The3DRenders? sports;
  The3DRenders? people;

  FluffyTopicSubmissions({
    this.animals,
    this.health,
    this.nature,
    this.wallpapers,
    this.architectureInterior,
    this.colorOfWater,
    this.currentEvents,
    this.spirituality,
    this.sports,
    this.people,
  });

  factory FluffyTopicSubmissions.fromMap(Map<String, dynamic> json) =>
      FluffyTopicSubmissions(
        animals: json["animals"] == null
            ? null
            : The3DRenders.fromMap(json["animals"]),
        health: json["health"] == null
            ? null
            : The3DRenders.fromMap(json["health"]),
        nature: json["nature"] == null
            ? null
            : The3DRenders.fromMap(json["nature"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : The3DRenders.fromMap(json["wallpapers"]),
        architectureInterior: json["architecture-interior"] == null
            ? null
            : The3DRenders.fromMap(json["architecture-interior"]),
        colorOfWater: json["color-of-water"] == null
            ? null
            : The3DRenders.fromMap(json["color-of-water"]),
        currentEvents: json["current-events"] == null
            ? null
            : The3DRenders.fromMap(json["current-events"]),
        spirituality: json["spirituality"] == null
            ? null
            : The3DRenders.fromMap(json["spirituality"]),
        sports: json["sports"] == null
            ? null
            : The3DRenders.fromMap(json["sports"]),
        people: json["people"] == null
            ? null
            : The3DRenders.fromMap(json["people"]),
      );

  Map<String, dynamic> toMap() => {
        "animals": animals?.toMap(),
        "health": health?.toMap(),
        "nature": nature?.toMap(),
        "wallpapers": wallpapers?.toMap(),
        "architecture-interior": architectureInterior?.toMap(),
        "color-of-water": colorOfWater?.toMap(),
        "current-events": currentEvents?.toMap(),
        "spirituality": spirituality?.toMap(),
        "sports": sports?.toMap(),
        "people": people?.toMap(),
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
