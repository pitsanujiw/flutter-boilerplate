import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// pkg
import 'package:flutter_boilerplate/routes/routes.dart';
import 'package:flutter_boilerplate/screens/screens.dart';
import 'package:flutter_boilerplate/providers/providers.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    GestureBinding.instance.resamplingEnabled = true;
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MyApp(),
    ));
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateRoute: (RouteSettings settings) => CupertinoPageRoute(
            settings: settings,
            builder: (BuildContext context) =>
                appRoute.routes[settings.name](context, settings.arguments)),
        navigatorObservers: [
          appRoute,
        ],
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
}
