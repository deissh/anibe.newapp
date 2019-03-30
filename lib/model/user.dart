import 'dart:convert';

import 'package:http/http.dart' as http;

import 'manga.dart';

class CurrentUser {
  String id;
  bool online;
  String name;
  String picture;
  String desc;
  List<Badges> badges;
  String email;
  String role;
  List<ShortManga> favorite;
  List<ShortManga> thrown;
  List<ShortManga> inprogress;
  List<ShortManga> readed;
  List<ShortManga> willread;
  String createdAt;

  CurrentUser(
      {this.id,
      this.online,
      this.name,
      this.picture,
      this.desc,
      this.badges,
      this.email,
      this.role,
      this.favorite,
      this.thrown,
      this.inprogress,
      this.readed,
      this.willread,
      this.createdAt});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    online = json['online'];
    name = json['name'];
    picture = json['picture'];
    desc = json['desc'];
    if (json['badges'] != null) {
      badges = new List<Badges>();
      json['badges'].forEach((v) {
        badges.add(new Badges.fromJson(v));
      });
    }
    email = json['email'];
    role = json['role'];
    if (json['favorite'] != null) {
      favorite = new List<ShortManga>();
      json['favorite'].forEach((v) {
        favorite.add(new ShortManga.fromJson(v));
      });
    }
    if (json['thrown'] != null) {
      thrown = new List<ShortManga>();
      json['thrown'].forEach((v) {
        thrown.add(new ShortManga.fromJson(v));
      });
    }
    if (json['inprogress'] != null) {
      inprogress = new List<ShortManga>();
      json['inprogress'].forEach((v) {
        inprogress.add(new ShortManga.fromJson(v));
      });
    }
    if (json['readed'] != null) {
      readed = new List<ShortManga>();
      json['readed'].forEach((v) {
        readed.add(new ShortManga.fromJson(v));
      });
    }
    if (json['willread'] != null) {
      willread = new List<ShortManga>();
      json['willread'].forEach((v) {
        willread.add(new ShortManga.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['online'] = this.online;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['desc'] = this.desc;
    if (this.badges != null) {
      data['badges'] = this.badges.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['role'] = this.role;
    if (this.favorite != null) {
      data['favorite'] = this.favorite.map((v) => v.toJson()).toList();
    }
    if (this.thrown != null) {
      data['thrown'] = this.thrown.map((v) => v.toJson()).toList();
    }
    if (this.inprogress != null) {
      data['inprogress'] = this.inprogress.map((v) => v.toJson()).toList();
    }
    if (this.readed != null) {
      data['readed'] = this.readed.map((v) => v.toJson()).toList();
    }
    if (this.willread != null) {
      data['willread'] = this.willread.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }

  static Future<CurrentUser> fromApi() async {
    // todo: add auth
    http.Response res = await http.get('https://api.anibe.ru/users/me');

    if (res.statusCode == 200) {
    // If server returns an OK response, parse the JSON
      return CurrentUser.fromJson(json.decode(res.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load');
    }
  }
}

class User {
  String id;
  bool online;
  String name;
  String picture;
  String role;
  List<Badges> badges;

  User(
      {this.id, this.online, this.name, this.picture, this.role, this.badges});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    online = json['online'];
    name = json['name'];
    picture = json['picture'];
    role = json['role'];
    if (json['badges'] != null) {
      badges = new List<Badges>();
      json['badges'].forEach((v) {
        badges.add(new Badges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['online'] = this.online;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['role'] = this.role;
    if (this.badges != null) {
      data['badges'] = this.badges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Badges {
  String name;
  String icon;

  Badges({this.name, this.icon});

  Badges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}