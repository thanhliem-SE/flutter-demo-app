import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  String? id;
  String name;
  String img;

  String? getId() => id;

  void setId(id) => this.id = id;

  String getName() => name;

  void setName(name) => this.name = name;

  String getImg() => img;

  void setImg(img) => this.img = img;

  Category({this.id, required this.name, required this.img});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
