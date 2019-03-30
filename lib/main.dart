import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:anibe_newapp/pages/index.dart';

class MyApp extends StatelessWidget {
  Widget isLogin() {
    // todo: add user verification and open login page
    return TabsPage();
  }

  @override
  Widget build(BuildContext context) {

    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'Anibe Manga',
          theme: theme,
          home: isLogin(),
        );
      }
    );
  }
}

void main() => runApp(new MyApp());
