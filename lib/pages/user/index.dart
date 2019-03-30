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
    return ListView(
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    minRadius: 60,
                    backgroundColor: Theme.of(context).textSelectionColor,
                    child: CircleAvatar(
                      backgroundImage: new CachedNetworkImageProvider(widget.user.picture),
                      minRadius: 55,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(widget.user.name, style: TextStyle(fontSize: 22.0, color: Colors.white),),
              Text(widget.user.desc, style: TextStyle(fontSize: 14.0, color: Colors.white),)
            ],
          ),
        ),

        ListTile(
          title: Text('Любимое'),
        ),
        Divider(),
        ListTile(
          title: Text('Читаю'),
        ),
        Divider(),
        ListTile(
          title: Text('Буду читать'),
        ),
        Divider(),
        ListTile(
          title: Text('Прочитано'),
        ),
        Divider(),
        ListTile(
          title: Text('Брошено'),
        ),
        Divider(),
      ],
    );
  }
}