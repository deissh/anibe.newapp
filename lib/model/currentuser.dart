import 'dart:async';
import 'dart:convert';

import 'package:anibe_newapp/model/client.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rxtable/flutter_rxtable.dart';

import 'package:anibe_newapp/model/manga.dart';
import 'package:anibe_newapp/model/db.dart';

class AnibeCurrentUser {
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

  AnibeCurrentUser(
      {this.id,
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

  @override
  int get hashCode =>
    id.hashCode
    ^ inprogress.hashCode
    ^ thrown.hashCode
    ^ favorite.hashCode
    ^ readed.hashCode
    ^ willread.hashCode;

  @override
  String toString() {
    return 'AnibeCurrentUser{id: $id, name: $name, picture: $picture, desc: $desc, badges: $badges, email: $email, role: $role, favorite: $favorite, thrown: $thrown, inprogress: $inprogress, readed: $readed, willread: $willread, createdAt: $createdAt}';
  }


  AnibeCurrentUser.fromJson(dynamic json) {
    id = json['id'];
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


class UsersModule {
  final Provider provider;
  AnibeDatabase get db => provider.inject<AnibeDatabase>();
  ClientModule get client => provider.inject<ClientModule>();

  UsersModule(this.provider);

  static UsersModule of(BuildContext context) => Injector.inject<UsersModule>(context);

  Future<void> init() async {
    if (client.token != null) {
      try {
        final resp = await client.get("https://api.anibe.ru/users/me");
        final json = jsonDecode(resp.body);
        final user = AnibeCurrentUser.fromJson(json);
        db.users.save(user);
        db.signedUser.put(user.id);
      } on HttpException catch (ex) {
        if (ex.statusCode == 401) {
          await signOut();
        } else {
          rethrow;
        }
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    String md5Password = md5.convert(password.codeUnits).toString();
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$email:$md5Password'));

    final resp = await client.post("https://api.anibe.ru/auth", headers: {
      'Authorization': basicAuth
    });
    if (resp.statusCode != 200) throw Exception("Sign in failed with code = ${resp.statusCode}");

    var res = json.decode(resp.body);

    final token = res['token'];
    await client.saveToken(token);
    await init();
  }


  Future<void> signOut() async {
    await client.resetToken();
    db.signedUser.delete();
  }

}