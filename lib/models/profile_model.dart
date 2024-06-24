// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  Data data;
  String message;

  ProfileModel({
    required this.data,
    required this.message,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String email;
  String fullname;
  String id;
  String noHp;
  String photo;

  Data({
    required this.email,
    required this.fullname,
    required this.id,
    required this.noHp,
    required this.photo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        fullname: json["fullname"],
        id: json["id"],
        noHp: json["no_hp"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "id": id,
        "no_hp": noHp,
        "photo": photo,
      };
}
