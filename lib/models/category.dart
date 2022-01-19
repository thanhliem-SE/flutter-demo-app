// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryListFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryListToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.name,
    required this.img,
    required this.description,
    required this.index,
    this.id = "",
  });

  String name;
  String img;
  String description;
  int index;
  String id;
  String get getName => name;

  set setName(String name) => this.name = name;

  get getImg => img;

  set setImg(img) => this.img = img;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  get getIndex => index;

  set setIndex(index) => this.index = index;

  get getId => id;

  set setId(id) => this.id = id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        img: json["img"],
        description: json["description"],
        index: json["index"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "description": description,
        "index": index,
        "id": id,
      };
}
