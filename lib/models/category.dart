import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  String? id;
  String name;
  String img;
 String? get getId => id;

 set setId(String? id) => this.id = id;

  get getName => name;

 set setName( name) => this.name = name;

  get getImg => img;

 set setImg( img) => this.img = img;

  Category({this.id, required this.name, required this.img});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() => 'Category(id: $id, name: $name, img: $img)';
}
