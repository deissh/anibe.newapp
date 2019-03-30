import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/index.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  var tabs = new TabBar(
    tabs: [
      Tab(
        icon: new Icon(Icons.home),
      ),
      Tab(
        icon: new Icon(Icons.search),
      ),
      Tab(
        icon: new Icon(Icons.notifications),
      ),
      Tab(
        icon: new Icon(Icons.perm_identity),
      )
    ],
    labelColor: Colors.grey,
    unselectedLabelColor: Colors.grey,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: new Scaffold(
        body: TabBarView(
          children: [
            HomePage(),
            new Container(color: Colors.orange,),
            new Container(color: Colors.lightGreen,),
            new Container(color: Colors.red,),
          ],
        ),
        bottomNavigationBar: tabs
        // backgroundColor: Colors.black,
      ),
    );
  }
}