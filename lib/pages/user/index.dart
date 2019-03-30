import 'package:anibe_newapp/pages/listview/index.dart';
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListViewPage("Любимое", widget.user.favorite);
              })
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('Читаю'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListViewPage("Читаю", widget.user.favorite);
              })
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('Буду читать'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListViewPage("Буду читать", widget.user.favorite);
              })
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('Прочитано'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListViewPage("Прочитано", widget.user.favorite);
              })
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('Брошено'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListViewPage("Брошено", widget.user.favorite);
              })
            );
          },
        ),
        Divider(),
      ],
    );
  }
}