/* // To parse this JSON data, do
//
//     final favModel = favModelFromJson(jsonString);

import 'dart:convert';

FavModel favModelFromJson(String str) => FavModel.fromJson(json.decode(str));

String favModelToJson(FavModel data) => json.encode(data.toJson());

class FavModel {
  List<Favorite>? favorites;

  FavModel({
    this.favorites,
  });
  FavModel.empty() : favorites = [];
  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        favorites: json["favorites"] == null
            ? []
            : List<Favorite>.from(
                json["favorites"]!.map((x) => Favorite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favorites": favorites == null
            ? []
            : List<dynamic>.from(favorites!.map((x) => x.toJson())),
      };
}

class Favorite {
  dynamic id;
  dynamic userId;
  dynamic serviceId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;

  Favorite({
    this.id,
    this.userId,
    this.serviceId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "service": service?.toJson(),
      };
}

class Service {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic status;
  dynamic categoryId;
  dynamic userId;
  dynamic price;
  dynamic payType;
  dynamic area;
  dynamic declineReason;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdAtHuman;
  dynamic updatedAtHuman;
  bool? isFavorite;
  MainImage? mainImage;
  Category? category;
  User? user;

  Service({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.status,
    this.categoryId,
    this.userId,
    this.price,
    this.payType,
    this.area,
    this.declineReason,
    this.createdAt,
    this.updatedAt,
    this.createdAtHuman,
    this.updatedAtHuman,
    this.isFavorite,
    this.mainImage,
    this.category,
    this.user,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        status: json["status"],
        categoryId: json["category_id"],
        userId: json["user_id"],
        price: json["price"],
        payType: json["pay_type"],
        area: json["area"],
        declineReason: json["decline_reason"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAtHuman: json["created_at_human"],
        updatedAtHuman: json["updated_at_human"],
        isFavorite: json["is_favorite"],
        mainImage: json["main_image"] == null
            ? null
            : MainImage.fromJson(json["main_image"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "status": status,
        "category_id": categoryId,
        "user_id": userId,
        "price": price,
        "pay_type": payType,
        "area": area,
        "decline_reason": declineReason,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at_human": createdAtHuman,
        "updated_at_human": updatedAtHuman,
        "is_favorite": isFavorite,
        "main_image": mainImage?.toJson(),
        "category": category?.toJson(),
        "user": user?.toJson(),
      };
}

class Category {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic image;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parentId;
  dynamic createdAtHuman;
  dynamic imageUrl;

  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.createdAtHuman,
    this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        createdAtHuman: json["created_at_human"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "created_at_human": createdAtHuman,
        "image_url": imageUrl,
      };
}

class MainImage {
  dynamic id;
  dynamic serviceId;
  dynamic image;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic url;

  MainImage({
    this.id,
    this.serviceId,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.url,
  });

  factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
        id: json["id"],
        serviceId: json["service_id"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "url": url,
      };
}

class User {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic status;
  dynamic role;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdAtHuman;
  dynamic avatar;
  dynamic cover;
  MetaData? metaData;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.createdAtHuman,
    this.avatar,
    this.cover,
    this.metaData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        role: json["role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAtHuman: json["created_at_human"],
        avatar: json["avatar"],
        cover: json["cover"],
        metaData: json["meta_data"] == null
            ? null
            : MetaData.fromJson(json["meta_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at_human": createdAtHuman,
        "avatar": avatar,
        "cover": cover,
        "meta_data": metaData?.toJson(),
      };
}

class MetaData {
  bool? providerAccess;
  dynamic avatar;

  MetaData({
    this.providerAccess,
    this.avatar,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        providerAccess: json["provider_access"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "provider_access": providerAccess,
        "avatar": avatar,
      };
}
 */

// To parse this JSON data, do
//
//     final favModel = favModelFromJson(jsonString);

/* import 'dart:convert';

FavModel favModelFromJson(String str) => FavModel.fromJson(json.decode(str));

String favModelToJson(FavModel data) => json.encode(data.toJson());

class FavModel {
  List<Favorite>? favorites;

  FavModel({
    this.favorites,
  });
  FavModel.empty();
  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        favorites: json["favorites"] == null
            ? []
            : List<Favorite>.from(
                json["favorites"]!.map((x) => Favorite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favorites": favorites == null
            ? []
            : List<dynamic>.from(favorites!.map((x) => x.toJson())),
      };
}

class Favorite {
  dynamic id;
  dynamic userId;
  dynamic serviceId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;

  Favorite({
    this.id,
    this.userId,
    this.serviceId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "service": service?.toJson(),
      };
}

class Service {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic status;
  dynamic categoryId;
  dynamic userId;
  dynamic price;
  dynamic payType;
  dynamic area;
  dynamic declineReason;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdAtHuman;
  dynamic updatedAtHuman;
  bool? isFavorite;
  MainImage? mainImage;
  Category? category;
  User? user;

  Service({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.status,
    this.categoryId,
    this.userId,
    this.price,
    this.payType,
    this.area,
    this.declineReason,
    this.createdAt,
    this.updatedAt,
    this.createdAtHuman,
    this.updatedAtHuman,
    this.isFavorite,
    this.mainImage,
    this.category,
    this.user,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        status: json["status"],
        categoryId: json["category_id"],
        userId: json["user_id"],
        price: json["price"],
        payType: json["pay_type"],
        area: json["area"],
        declineReason: json["decline_reason"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAtHuman: json["created_at_human"],
        updatedAtHuman: json["updated_at_human"],
        isFavorite: json["is_favorite"],
        mainImage: json["main_image"] == null
            ? null
            : MainImage.fromJson(json["main_image"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "status": status,
        "category_id": categoryId,
        "user_id": userId,
        "price": price,
        "pay_type": payType,
        "area": area,
        "decline_reason": declineReason,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at_human": createdAtHuman,
        "updated_at_human": updatedAtHuman,
        "is_favorite": isFavorite,
        "main_image": mainImage?.toJson(),
        "category": category?.toJson(),
        "user": user?.toJson(),
      };
}

class Category {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic image;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parentId;
  dynamic createdAtHuman;
  dynamic imageUrl;

  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.createdAtHuman,
    this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        createdAtHuman: json["created_at_human"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "created_at_human": createdAtHuman,
        "image_url": imageUrl,
      };
}

class MainImage {
  dynamic id;
  dynamic serviceId;
  dynamic image;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic url;

  MainImage({
    this.id,
    this.serviceId,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.url,
  });

  factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
        id: json["id"],
        serviceId: json["service_id"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "url": url,
      };
}

class User {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic status;
  dynamic role;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdAtHuman;
  dynamic avatar;
  dynamic cover;
  MetaData? metaData;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.createdAtHuman,
    this.avatar,
    this.cover,
    this.metaData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        role: json["role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAtHuman: json["created_at_human"],
        avatar: json["avatar"],
        cover: json["cover"],
        metaData: json["meta_data"] == null
            ? null
            : MetaData.fromJson(json["meta_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at_human": createdAtHuman,
        "avatar": avatar,
        "cover": cover,
        "meta_data": metaData?.toJson(),
      };
}

class MetaData {
  bool? providerAccess;
  dynamic avatar;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic gender;
  dynamic age;
  dynamic homeTown;
  dynamic cover;
  Address? address;
  Mobile? mobile;
  dynamic bio;
  dynamic mobileMobile1;
  dynamic mobileMobile2;

  MetaData({
    this.providerAccess,
    this.avatar,
    this.addressLine1,
    this.addressLine2,
    this.gender,
    this.age,
    this.homeTown,
    this.cover,
    this.address,
    this.mobile,
    this.bio,
    this.mobileMobile1,
    this.mobileMobile2,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        providerAccess: json["provider_access"],
        avatar: json["avatar"],
        addressLine1: json["address[line1]"],
        addressLine2: json["address[line2]"],
        gender: json["gender"],
        age: json["age"],
        homeTown: json["home_town"],
        cover: json["cover"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        mobile: json["mobile"] == null ? null : Mobile.fromJson(json["mobile"]),
        bio: json["bio"],
        mobileMobile1: json["mobile[mobile1]"],
        mobileMobile2: json["mobile[mobile2]"],
      );

  Map<String, dynamic> toJson() => {
        "provider_access": providerAccess,
        "avatar": avatar,
        "address[line1]": addressLine1,
        "address[line2]": addressLine2,
        "gender": gender,
        "age": age,
        "home_town": homeTown,
        "cover": cover,
        "address": address?.toJson(),
        "mobile": mobile?.toJson(),
        "bio": bio,
        "mobile[mobile1]": mobileMobile1,
        "mobile[mobile2]": mobileMobile2,
      };
}

class Address {
  dynamic line1;
  dynamic line2;
  dynamic line3;

  Address({
    this.line1,
    this.line2,
    this.line3,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"],
        line2: json["line2"],
        line3: json["line3"],
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
        "line3": line3,
      };
}

class Mobile {
  dynamic mobile1;
  dynamic mobile2;

  Mobile({
    this.mobile1,
    this.mobile2,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        mobile1: json["mobile1"],
        mobile2: json["mobile2"],
      );

  Map<String, dynamic> toJson() => {
        "mobile1": mobile1,
        "mobile2": mobile2,
      };
}
 */

// To parse this JSON data, do
//
//     final favModel = favModelFromJson(jsonString);

import 'dart:convert';

FavModel favModelFromJson(String str) => FavModel.fromJson(json.decode(str));

String favModelToJson(FavModel data) => json.encode(data.toJson());

class FavModel {
  List<Favorite>? favorites;

  FavModel({
    this.favorites,
  });
  FavModel.empty() : favorites = [];
  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        favorites: json["favorites"] == null
            ? []
            : List<Favorite>.from(
                json["favorites"]!.map((x) => Favorite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favorites": favorites == null
            ? []
            : List<dynamic>.from(favorites!.map((x) => x.toJson())),
      };
}

class Favorite {
  dynamic id;
  dynamic userId;
  dynamic serviceId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;

  Favorite({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.service,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "service": service?.toJson(),
      };
}

class Service {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic status;
  dynamic categoryId;
  dynamic userId;
  dynamic price;
  dynamic payType;
  dynamic area;
  dynamic declineReason;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdAtHuman;
  dynamic updatedAtHuman;
  bool? isFavorite;
  MainImage? mainImage;
  Category? category;
  User? user;

  Service({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.status,
    required this.categoryId,
    required this.userId,
    required this.price,
    required this.payType,
    required this.area,
    required this.declineReason,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAtHuman,
    required this.updatedAtHuman,
    required this.isFavorite,
    required this.mainImage,
    required this.category,
    required this.user,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        status: json["status"],
        categoryId: json["category_id"],
        userId: json["user_id"],
        price: json["price"],
        payType: json["pay_type"],
        area: json["area"],
        declineReason: json["decline_reason"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAtHuman: json["created_at_human"],
        updatedAtHuman: json["updated_at_human"],
        isFavorite: json["is_favorite"],
        mainImage: json["main_image"] == null
            ? null
            : MainImage.fromJson(json["main_image"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "status": status,
        "category_id": categoryId,
        "user_id": userId,
        "price": price,
        "pay_type": payType,
        "area": area,
        "decline_reason": declineReason,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at_human": createdAtHuman,
        "updated_at_human": updatedAtHuman,
        "is_favorite": isFavorite,
        "main_image": mainImage?.toJson(),
        "category": category?.toJson(),
        "user": user?.toJson(),
      };
}

class Category {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic description;
  dynamic image;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parentId;
  dynamic createdAtHuman;
  dynamic imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.parentId,
    required this.createdAtHuman,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        createdAtHuman: json["created_at_human"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "created_at_human": createdAtHuman,
        "image_url": imageUrl,
      };
}

class MainImage {
  dynamic id;
  dynamic serviceId;
  dynamic image;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic url;
  dynamic thumb;

  MainImage({
    required this.id,
    required this.serviceId,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.thumb,
  });

  factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
        id: json["id"],
        serviceId: json["service_id"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        url: json["url"],
          thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "url": url,
      };
}

class User {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic status;
  dynamic role;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdAtHuman;
  dynamic avatar;
  dynamic cover;
  MetaData? metaData;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.status,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAtHuman,
    required this.avatar,
    required this.cover,
    required this.metaData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        role: json["role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAtHuman: json["created_at_human"],
        avatar: json["avatar"],
        cover: json["cover"],
        metaData: json["meta_data"] == null
            ? null
            : MetaData.fromJson(json["meta_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at_human": createdAtHuman,
        "avatar": avatar,
        "cover": cover,
        "meta_data": metaData?.toJson(),
      };
}

class MetaData {
  bool? providerAccess;
  dynamic avatar;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic gender;
  dynamic age;
  dynamic homeTown;
  dynamic cover;
  // Address? address;
  Mobile? mobile;
  dynamic bio;
  dynamic mobileMobile1;
  dynamic mobileMobile2;

  MetaData({
    required this.providerAccess,
    required this.avatar,
    required this.addressLine1,
    required this.addressLine2,
    required this.gender,
    required this.age,
    required this.homeTown,
    required this.cover,
    // this.address,
    required this.mobile,
    required this.bio,
    required this.mobileMobile1,
    required this.mobileMobile2,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        providerAccess: json["provider_access"],
        avatar: json["avatar"],
        addressLine1: json["address[line1]"],
        addressLine2: json["address[line2]"],
        gender: json["gender"],
        age: json["age"],
        homeTown: json["home_town"],
        cover: json["cover"],
        /*   address:
            json["address"] == null ? null : Address.fromJson(json["address"]), */
        mobile: json["mobile"] == null ? null : Mobile.fromJson(json["mobile"]),
        bio: json["bio"],
        mobileMobile1: json["mobile[mobile1]"],
        mobileMobile2: json["mobile[mobile2]"],
      );

  Map<String, dynamic> toJson() => {
        "provider_access": providerAccess,
        "avatar": avatar,
        "address[line1]": addressLine1,
        "address[line2]": addressLine2,
        "gender": gender,
        "age": age,
        "home_town": homeTown,
        "cover": cover,
        //  "address": address?.toJson(),
        "mobile": mobile?.toJson(),
        "bio": bio,
        "mobile[mobile1]": mobileMobile1,
        "mobile[mobile2]": mobileMobile2,
      };
}

class Address {
  dynamic line1;
  dynamic line2;
  dynamic line3;

  Address({
    required this.line1,
    required this.line2,
    required this.line3,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"],
        line2: json["line2"],
        line3: json["line3"],
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
        "line3": line3,
      };
}

class Mobile {
  dynamic mobile1;
  dynamic mobile2;

  Mobile({
    required this.mobile1,
    required this.mobile2,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        mobile1: json["mobile1"],
        mobile2: json["mobile2"],
      );

  Map<String, dynamic> toJson() => {
        "mobile1": mobile1,
        "mobile2": mobile2,
      };
}
