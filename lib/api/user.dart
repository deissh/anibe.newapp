import 'package:anibe_newapp/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  final String token;

  UserApi(this.token);

  Future<CurrentUser> me() async {
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

  Future<User> get(String id) async {
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

  Future<User> login(String email, String password) async {
    String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$email:$password'));

    // todo: add auth
    http.Response res = await http.post('https://api.anibe.ru/auth', headers: {'authorization': basicAuth});

    if (res.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var output = json.decode(res.body);

      prefs.setString('token', output['token']);
      
      return User.fromJson(output['user']);
    } else {
      // If that response was not OK, throw an error.
      throw Exception(res.body);
    }
  }
}