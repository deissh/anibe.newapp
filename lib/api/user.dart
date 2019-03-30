import 'package:anibe_newapp/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserApi {
  final String token;

  UserApi(this.token);

  static Future<CurrentUser> me() async {
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

  static Future<User> get(String id) async {
    // todo: add auth
    http.Response res = await http.get('https://api.anibe.ru/users/' + id);

    if (res.statusCode == 200) {
    // If server returns an OK response, parse the JSON
      return User.fromJson(json.decode(res.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load');
    }
  }
}