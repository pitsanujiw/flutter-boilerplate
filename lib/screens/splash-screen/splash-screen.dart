import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  static const ROUTE_NAME = RouteConstant.SPLASH;
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Splash'),
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.grey,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // use colors white.
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.red, // use colors white.
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(
                        top: 100, left: 60, right: 60, bottom: 0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(
                        top: 50, left: 60, right: 60, bottom: 40),
                    child: Text(
                      'SPLASH SCRREN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context, rootNavigator: true)
              .pushNamed(RouteConstant.HOME),
          child: Text('HOME'),
        ),
      );
}
