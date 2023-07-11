

import 'game.dart';

class Genre {
  int id = 0;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  List<Game>? games;

  Genre(
      this.id,{
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.games});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
    if (json['games'] != null) {
      games = <Game>[];
      json['games'].forEach((v) {
        games!.add(Game.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['games_count'] = gamesCount;
    data['image_background'] = imageBackground;
    if (games != null) {
      data['games'] = games!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
