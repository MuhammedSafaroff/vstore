// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'package:flutter/widgets.dart';

class StoreModel {
  StoreModel({
    this.storeName,
    this.catagory,
    this.image,
    this.coverImage,
    this.product,
    this.follower,
    this.rating,
    this.contact,
  });

  String storeName;
  String catagory;
  String image;
  String coverImage;
  Product product;
  Follower follower;
  int rating;
  Contact contact;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        storeName: json["storeName"],
        catagory: json["catagory"],
        image: json["image"],
        coverImage: json["coverImage"],
        product: Product.fromJson(json["product"]),
        follower: Follower.fromJson(json["follower"]),
        rating: json["rating"],
        contact: Contact.fromJson(json["contact"]),
      );
}

class Contact {
  Contact({
    this.aboutStore,
    this.tel,
    this.email,
    this.latlng,
    this.adress,
    this.internetAdress,
  });

  String aboutStore;
  String tel;
  String email;
  String latlng;
  String adress;
  InternetAdress internetAdress;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        aboutStore: json["aboutStore"],
        tel: json["tel"],
        email: json["email"],
        latlng: json["latlng"],
        adress: json["adress"],
        internetAdress: InternetAdress.fromJson(json["internetAdress"]),
      );
}

class InternetAdress {
  InternetAdress({
    this.facebook,
    this.instagram,
    this.twitter,
    this.whatsapp,
  });

  String facebook;
  String instagram;
  String twitter;
  String whatsapp;

  factory InternetAdress.fromJson(Map<String, dynamic> json) => InternetAdress(
        facebook: json["facebook"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        whatsapp: json["whatsapp"],
      );
}

class Follower {
  Follower({
    this.followers,
  });

  List<dynamic> followers;

  factory Follower.fromJson(Map<String, dynamic> json) =>
      Follower(followers: json["followers"]);
}

class Product {
  Product({
    this.products,
  });

  List<dynamic> products;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: json["products"],
      );
}
