class ShortManga {
  String id;
  String name;
  String annotation;
  String cover;
  String author;
  List<String> genre;
  String type;
  double rating;

  ShortManga(
      {this.id,
      this.name,
      this.annotation,
      this.cover,
      this.author,
      this.genre,
      this.type,
      this.rating});

  ShortManga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    annotation = json['annotation'];
    cover = json['cover'];
    author = json['author'];
    genre = json['genre'].cast<String>();
    type = json['type'];
    rating = json['rating'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['annotation'] = this.annotation;
    data['cover'] = this.cover;
    data['author'] = this.author;
    data['genre'] = this.genre;
    data['type'] = this.type;
    data['rating'] = this.rating;
    return data;
  }
}

class Manga {
  String id;
  String name;
  String annotation;
  String description;
  List<String> genre;
  String type;
  double rating;
  String status;
  String date;
  String author;
  String cover;
  String chapters;
  String pages;
  String reading;
  Map<String, Map<String, String>> episodes;
  String createdAt;
  String updatedAt;

  Manga(
      {this.id,
      this.name,
      this.annotation,
      this.description,
      this.genre,
      this.type,
      this.rating,
      this.status,
      this.date,
      this.author,
      this.cover,
      this.chapters,
      this.pages,
      this.reading,
      this.episodes,
      this.createdAt,
      this.updatedAt});

  Manga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    annotation = json['annotation'];
    description = json['description'];
    genre = json['genre'].cast<String>();
    type = json['type'];
    rating = json['rating'].toDouble();
    status = json['status'];
    date = json['date'];
    author = json['author'];
    cover = json['cover'];
    chapters = json['chapters'];
    pages = json['pages'];
    reading = json['reading'];
    episodes = json['episodes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['annotation'] = this.annotation;
    data['description'] = this.description;
    data['genre'] = this.genre;
    data['type'] = this.type;
    data['rating'] = this.rating;
    data['status'] = this.status;
    data['date'] = this.date;
    data['author'] = this.author;
    data['cover'] = this.cover;
    data['chapters'] = this.chapters;
    data['pages'] = this.pages;
    data['reading'] = this.reading;
    data['episodes'] = this.episodes;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

