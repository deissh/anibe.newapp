import 'package:anibe_newapp/components/manga.card.dart';
import 'package:flutter/material.dart';
import 'package:anibe_newapp/model/manga.dart';

class ListViewPage extends StatelessWidget {
  final String type;
  final List<ShortManga> manga;

  ListViewPage(this.type, this.manga);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.type),
      ),
      body: ListView.builder(
        itemBuilder: _buildListView,
        itemCount: manga.length,
      )
    );
  }

  Widget _buildListView(BuildContext context, int index) {
    ShortManga item = manga[index];
    return MangaCard(item);
  }
}