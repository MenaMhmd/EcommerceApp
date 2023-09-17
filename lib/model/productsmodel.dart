import 'dart:convert';

class ProductsModel {
  int id;
  String title;
  int price;
  String description;
  List<String> images;
  DateTime creationAt;
  DateTime updatedAt;
  Category category;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "category": category.toJson(),
  };
}

class Category {
  int id;
  Name? name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: nameValues.map[json["name"]],
    image: json["image"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "image": image,
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

enum Name {
  CHAN_FD_FGE_TITLE,
  ELECTRONICS,
  NEW_CLOTHES,
  OTHERS,
  SHOES
}

final nameValues = EnumValues({
  "ChanFDFge title": Name.CHAN_FD_FGE_TITLE,
  "Electronics": Name.ELECTRONICS,
  "New Clothes": Name.NEW_CLOTHES,
  "Others": Name.OTHERS,
  "Shoes": Name.SHOES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
