import 'package:anibe_newapp/api/user.dart';

class api {
  final String token;

  api(this.token);

  UserApi get user => new UserApi(token);
}