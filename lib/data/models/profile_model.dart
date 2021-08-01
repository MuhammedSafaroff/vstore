// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel(
      {this.photeUrl = '',
      this.phoneNumber = '',
      this.gender = '',
      this.fullName = '',
      this.email = '',
      this.token = '',
      this.doYouHaveAStore = false});

  String photeUrl;
  String phoneNumber;
  String gender;
  String fullName;
  String email;
  String token;
  bool doYouHaveAStore;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      photeUrl: json["photeURL"],
      phoneNumber: json["phoneNumber"],
      gender: json["gender"],
      fullName: json["fullName"],
      email: json["email"],
      doYouHaveAStore: json['doYouHaveAStore']);

  Map<String, dynamic> toJson() => {
        "photeURL": photeUrl,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "fullName": fullName,
        "email": email,
        "doYouHaveAStore": doYouHaveAStore
      };
}
