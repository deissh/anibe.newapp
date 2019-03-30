
import 'package:anibe_newapp/pages/login/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 50.0,),
          _buildLoginForm(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignupPage();
                    }),
                  );
                },
                child: Text("Регистрация", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.0)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              ClipPath(
                child: Container(
                  height: 400,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 90.0,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            hintText: "Никнейм",
                            border: InputBorder.none,
                            icon: Icon(Icons.email,)
                          ),
                        )
                      ),
                      Container(child: Divider(color: Theme.of(context).primaryColor,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            hintText: "Пароль",
                            border: InputBorder.none,
                            icon: Icon(Icons.lock)
                          ),
                        )
                      ),
                      Container(child: Divider(color: Theme.of(context).primaryColor,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                      SizedBox(height: 10.0,),
                      
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(child: Image.asset('assets/img/origami.png'), maxRadius: 80, backgroundColor: Colors.transparent,),
                ],
              ),
              Container(
                height: 420,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                    child: Text("Войти", style: TextStyle(color: Colors.white70)),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
        );
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _buildPageContent(context),
      );
    }
}