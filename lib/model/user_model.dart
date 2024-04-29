// To parse this JSON data, do
//
//     final currentUser = currentUserFromJson(jsonString);

import 'dart:convert';

CurrentUser currentUserFromJson(String str) =>
    CurrentUser.fromJson(json.decode(str));

String currentUserToJson(CurrentUser data) => json.encode(data.toJson());

class CurrentUser {
  User user;

  CurrentUser({
    required this.user,
  });
  CurrentUser.empty() : user = User.empty();
  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String status;
  String role;
  String serviceProviderType;
  int trailPeriodTime;
  DateTime createdAt;
  DateTime updatedAt;
  String createdAtHuman;
  String avatar;
  String cover;
  bool freeServiceAvailable;
  MetaData? metaData;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.status,
    required this.role,
    required this.serviceProviderType,
    required this.trailPeriodTime,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAtHuman,
    required this.avatar,
    required this.cover,
    required this.metaData,
    required this.freeServiceAvailable,
  });

  User.empty()
      : id = 0,
        name = '',
        email = '',
        emailVerifiedAt = '',
        status = '',
        role = '',
        serviceProviderType = '',
        trailPeriodTime = 0,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        createdAtHuman = '',
        avatar = '',
        cover = '',
      
        freeServiceAvailable = false,
        metaData = MetaData.empty();

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? '' : json["name"],
        email: json["email"] == null ? '' : json["email"],
        emailVerifiedAt: json["email_verified_at"] == null ? '' : json["name"],
        status: json["status"] == null ? '' : json["status"],
        role: json["role"] == null ? '' : json["role"],
        serviceProviderType: json["service_provider_type"] == null
            ? ''
            : json["service_provider_type"],
        trailPeriodTime:
            json["trail_period_time"] == null ? '' : json["trail_period_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAtHuman:
            json["created_at_human"] == null ? '' : json["created_at_human"],
        avatar: json["avatar"] == null ? '' : json["avatar"],
        cover: json["cover"] == null ? '' : json["cover"],
         freeServiceAvailable: json["free_service_available"] == null ? false: json["free_service_available"],
        metaData: json["meta_data"] != []
            ? MetaData.fromJson(json["meta_data"])
            : null,
        /*  MetaData.fromJson(json["meta_data"]), */
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_at_human": createdAtHuman,
        "avatar": avatar,
        "cover": cover,
      };
}

class MetaData {
  String avatar;
  String cover;
  String homeTown;
  String gender;
  String age;
  // String? address1;
  // String? address2;
  // Mobile? mobile;
  // Phone? phone;
  Mobile? mobile;
  Address? address;
  String? phoneMobile1;
  String? phoneMobile2;
  String bio;
  int freeService;
  bool providerAccess;

  MetaData({
    required this.avatar,
    required this.cover,
    required this.homeTown,
    required this.gender,
    required this.age,
    // required this.address1,
    // required this.address2,
    required this.address,
    required this.mobile,
    //  required this.phone,
    required this.phoneMobile1,
    required this.phoneMobile2,
    required this.bio,
    required this.freeService,
    required this.providerAccess,
  });

  MetaData.empty()
      : avatar = '',
        cover = '',
        homeTown = '',
        gender = '',
        age = '',
        //    address1 = '',
        //    address2 = '',
        phoneMobile1 = '',
        phoneMobile2 = '',
        mobile = Mobile(mobile1: '', mobile2: ''),
        // phone = Phone(mobile1: '', mobile2: ''),
        bio = '',
        freeService = 0,
        
        // phone1 = '',
        // phone2 = '',
        address = Address(line1: "", line2: "", line3: "", line4: ""),
        providerAccess = false;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        avatar: json["avatar"] == null ? '' : json["avatar"],
        cover: json["cover"] == null ? '' : json["cover"],
        homeTown: json["home_town"] == null ? '' : json["home_town"],
        gender: json["gender"] == null ? '' : json["gender"],
        age: json["age"] == null ? '' : json["age"],
        phoneMobile1:
            json["mobile[mobile1]"] == null ? '' : json["mobile[mobile1]"],
        phoneMobile2:
            json["mobile[mobile2]"] == null ? '' : json["mobile[mobile2]"],
        //  address1: json["address[line1]"] == null ? '' : json["address[line1]"],
        //  address2: json["address[line2]"] == null ? '' : json["address[line2]"],
        //   phone1: json["address[line1]"] == null ? '' : json["address[line1]"],
        //   Address.fromJson(json["address"]),
        address:
            json["address"] != null ? Address.fromJson(json["address"]) : null,
        mobile: json["mobile"] != null ? Mobile.fromJson(json["mobile"]) : null,

        //  phone: json["phone"] != null ? Phone.fromJson(json["phone"]) : null,
        //Mobile.fromJson(json["mobile"]),
        bio: json["bio"] == null ? '' : json["bio"],
          freeService: json["free_service"] == null ? 0 : json["free_service"],
        providerAccess:
            json["provider_access"] == null ? false : json["provider_access"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "cover": cover,
        "home_town": homeTown,
        "gender": gender,
        "age": age,
        "bio": bio,
        "provider_access": providerAccess,
      };
}

class Address {
  String line1;
  String line2;
  String line3;
  String line4;

  Address({
    required this.line1,
    required this.line2,
    required this.line3,
    required this.line4,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"] == null ? '' : json["line1"],
        line2: json["line2"] == null ? '' : json["line2"],
        line3: json["line3"] == null ? '' : json["line3"],
        line4: json["line4"] == null ? '' : json["line4"],
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
        "line3": line3,
      };
}

class Mobile {
  String mobile1;
  String mobile2;

  Mobile({
    required this.mobile1,
    required this.mobile2,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        mobile1: json["mobile1"] == null ? '' : json["mobile1"],
        mobile2: json["mobile2"] == null ? '' : json["mobile2"],
      );

  Map<String, dynamic> toJson() => {
        "mobile1": mobile1,
        "mobile2": mobile2,
      };
}

class Phone {
  String mobile1;
  String mobile2;

  Phone({
    required this.mobile1,
    required this.mobile2,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        mobile1: json["mobile1"] == null ? '' : json["mobile1"],
        mobile2: json["mobile2"] == null ? '' : json["mobile2"],
      );

  Map<String, dynamic> toJson() => {
        "mobile1": mobile1,
        "mobile2": mobile2,
      };
}
