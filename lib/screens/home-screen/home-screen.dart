import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_boilerplate/constants/route.constant.dart';
import 'package:flutter_boilerplate/providers/providers.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = RouteConstant.HOME;
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 0),
                  child: Text('Home Screen'),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 0, left: 40, right: 40, bottom: 30),
                  child: Text(context.watch<HomeProvider>().getName.toString()),
                ),
              ],
            )),
      );
}
