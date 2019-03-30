import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../model/user.dart';
class UserPage extends StatefulWidget {
  final CurrentUser user;

  UserPage(this.user);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: new CachedNetworkImageProvider(widget.user.picture),
        ),
        Text(widget.user.id),
        Text(widget.user.name),
        Text(widget.user.email)
      ],
    );
  }
}