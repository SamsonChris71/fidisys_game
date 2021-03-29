import 'dart:convert';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
  Game({
    this.name,
    this.description,
    this.url,
    this.minCount,
    this.maxCount,
    this.category,
    this.image,
    this.likes,
  });

  String name;
  String description;
  String url;
  String minCount;
  String maxCount;
  String category;
  String image;
  int likes;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        name: json["name"],
        description: json["description"],
        url: json["url"],
        minCount: json["minCount"],
        maxCount: json["maxCount"],
        category: json["category"],
        image: json["image"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "url": url,
        "minCount": minCount,
        "maxCount": maxCount,
        "category": category,
        "image": image,
        "likes": likes,
      };
}
