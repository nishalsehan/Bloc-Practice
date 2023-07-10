

class Game {
  int? id;
  String? slug;
  String? name;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  int? metaCritic;
  int? playtime;
  int? suggestionsCount;
  String? updated;
  String? userGame;
  int? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  String? clip;

  Game(
      {this.id,
        this.slug,
        this.name,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.metaCritic,
        this.playtime,
        this.suggestionsCount,
        this.updated,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.clip});

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    ratingsCount = json['ratings_count'];
    reviewsTextCount = json['reviews_text_count'];
    added = json['added'];
    metaCritic = json['metacritic'];
    playtime = json['playtime'];
    suggestionsCount = json['suggestions_count'];
    updated = json['updated'];
    userGame = json['user_game'];
    reviewsCount = json['reviews_count'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    clip = json['clip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['released'] = released;
    data['tba'] = tba;
    data['background_image'] = backgroundImage;
    data['rating'] = rating;
    data['rating_top'] = ratingTop;
    data['ratings_count'] = ratingsCount;
    data['reviews_text_count'] = reviewsTextCount;
    data['added'] = added;
    data['metacritic'] = metaCritic;
    data['playtime'] = playtime;
    data['suggestions_count'] = suggestionsCount;
    data['updated'] = updated;
    data['user_game'] = userGame;
    data['reviews_count'] = reviewsCount;
    data['saturated_color'] = saturatedColor;
    data['dominant_color'] = dominantColor;
    data['clip'] = clip;
    return data;
  }
}