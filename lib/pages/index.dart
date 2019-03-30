import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/index.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class TabsPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Главная", Icons.home),
    new DrawerItem("Поиск", Icons.search),
    new DrawerItem("Уведомления", Icons.notifications),
  ];

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
        return new Container();
      case 2:
        return new Container();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }
    drawerOptions.add(new Divider());
    drawerOptions.add(new SwitchListTile(
      title: Text('Темная тема'),
      value: Theme.of(context).brightness == Brightness.dark,
      onChanged: (bool newv) {
        DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
      },
    ));

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture: Hero(
                tag: 'UserAvatar',
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/21129524?s=460&v=4'),
                ),
              ),
              accountName: new Text("Deissh"),
              accountEmail: null,
            ),
            new Column(children: drawerOptions),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}