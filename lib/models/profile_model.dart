// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? status;
  Data? data;

  ProfileModel({
    this.status,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? fullname;
  String? email;
  String? noHp;
  String? photo;

  Data({
    this.id,
    this.fullname,
    this.email,
    this.noHp,
    this.photo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        noHp: json["no_hp"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "no_hp": noHp,
        "photo": photo,
      };
}
