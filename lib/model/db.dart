import 'package:flutter/widgets.dart';
import 'package:flutter_rxtable/flutter_rxtable.dart';

import 'package:anibe_newapp/model/currentuser.dart';
import 'package:anibe_newapp/model/manga.dart';

class AnibeDatabase extends RxDatabase {
  // RxTable<String, AnibeManga> _manga;
  RxTable<String, AnibeCurrentUser> _users;
  RxSingle<String> _signedUser;

  // RxTable<String, AnibeManga> get manga => _manga;
  RxTable<String, AnibeCurrentUser> get users => _users;
  RxSingle<String> get signedUser => _signedUser;

  AnibeDatabase() {
    _users = RxTable(this, (r) => r.id);

    _signedUser = RxSingle(this);
  }

  static AnibeDatabase of(BuildContext context) => RxDatabase.of<AnibeDatabase>(context);
}
