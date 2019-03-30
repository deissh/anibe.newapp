
import 'package:anibe_newapp/components/loading.dart';
import 'package:anibe_newapp/model/currentuser.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static const PATH = "sign-in";

  static SignInPage handler(BuildContext context, Map<String, dynamic> params) => SignInPage();

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _buildForm(context),
    );
  }

  ListView _buildForm(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 64.0,
      ),
      children: <Widget>[
        SizedBox(height: 32.0),
        TextField(
          controller: _email,
          decoration: InputDecoration(
            labelText: "Email",
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 32.0),
        TextField(
          controller: _password,
          decoration: InputDecoration(
            labelText: "Пароль",
          ),
          obscureText: true,
        ),
        SizedBox(height: 32.0),
        RaisedButton(
          onPressed: () => _signInPressed(context),
          child: Text(
            "Войти",
            style: Theme.of(context).accentTextTheme.button
          ),
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.symmetric(
            vertical: 16.0
          ),
        )
      ],
    );
  }

  void _signInPressed(BuildContext context) async {
    final email = _email.value.text;
    final password = _password.value.text;
    final future = UsersModule.of(context).signIn(email, password);
    await pushLoadingOverlay(context: context, future: future);
  }
}
