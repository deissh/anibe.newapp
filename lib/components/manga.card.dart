import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anibe_newapp/model/manga.dart';

class MangaCard extends StatelessWidget {
  final ShortManga manga;

  MangaCard(this.manga);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        margin: EdgeInsets.only(bottom: 20.0),
        height: 300,
        child: Row(
          children: <Widget>[
            Expanded(child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: new CachedNetworkImageProvider(manga.cover), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(color: Colors.grey,offset: Offset(5.0,5.0), blurRadius: 10.0)
                ]
              ),
            )),
            Expanded(child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(manga.name,style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height: 10.0,),
                  Text(manga.type, style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0
                  )),
                  SizedBox(height: 10.0,),
                  Text(manga.genre.join(", "), style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  )),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey,offset: Offset(5.0,5.0), blurRadius: 10.0)
                ]
              ),
            ),)
          ],
        ),
      );
  }
}