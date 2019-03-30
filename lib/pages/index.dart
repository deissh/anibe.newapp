import 'package:anibe_newapp/model/sqlite.dart';
import 'package:anibe_newapp/pages/route.dart';
import 'package:anibe_newapp/pages/signin.dart';
import 'package:anibe_newapp/pages/user/index.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rxtable/flutter_rxtable.dart';
import 'package:anibe_newapp/model/db.dart';
import 'package:anibe_newapp/model/client.dart';

import 'home/index.dart';
import '../model/currentuser.dart';

class DrawerItem {
  String title;
  // icon
  IconData icon;
  // enable show in menu
  bool show = true;
  DrawerItem(this.title, this.icon, this.show);
}

class TabsPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Главная", Icons.home, true),
    new DrawerItem("Профиль", Icons.notifications, false),
    new DrawerItem("Поиск", Icons.search, true),
    new DrawerItem("Уведомления", Icons.notifications, true),
  ];

  bool isLogin = false;
  AnibeCurrentUser user;

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedDrawerIndex = 0;

  final _provider = Provider();
  _TabsPageState() {
    _provider.provide(AnibeDatabase());
    
    _provider.provide(UsersModule(_provider));
  }

  @override
  void initState() {
    super.initState();

    defineRoute(SignInPage.PATH, SignInPage.handler);
  }


  Future<void> _init() async {
    final provider = _provider;
    final client = provider.inject<ClientModule>();
    final users = provider.inject<UsersModule>();
    final db = provider.inject<AnibeDatabase>();

    provider.provide(await initSqlite());
    await client.init();
    await users.init();

    resetRoute(context, db.signedUser.get() == null ? SignInPage.PATH : "");
  }


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
        return new UserPage(widget.user);
      case 2:
        return new Container();
      case 3:
        return new Container();

      default:
        return new Text("Not implement");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  Widget _getAccauntDrawer(BuildContext context) {
    if (widget.isLogin) {
      return new GestureDetector(
        onTap: () {
          _onSelectItem(1);
        },
        child: new UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: new CachedNetworkImageProvider(widget.user.picture),
          ),
          accountName: new Text(widget.user.name),
          accountEmail: Text(widget.user.email),
        ),
      );
    } else {
      return new GestureDetector(
        onTap: () {
          resetRoute(context, SignInPage.PATH);
        },
        child: new UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).textSelectionColor,
            child: Text('+'),
          ),
          accountName: Text('Anibe'),
          accountEmail: Text('Не авторизован'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      if (d.show) {
        drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
        );
      }
    }

    if (widget.isLogin) {
      drawerOptions.add(new ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Выйти'),
        onTap: () {
          setState(() {
            widget.isLogin = false;
          });
        },
      ));
    }
    drawerOptions.add(new Divider());
    drawerOptions.add(new SwitchListTile(
      title: Text('Темная тема β'),
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
        elevation: 0,
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            _getAccauntDrawer(context),
            new Column(children: drawerOptions),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}