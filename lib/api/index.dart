import 'package:anibe_newapp/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String token;

  Future<Api> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token = prefs.getString('user_token');
    return this;
  }

  UserApi get user => new UserApi(token);
}