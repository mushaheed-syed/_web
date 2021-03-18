import 'package:flutter/material.dart';
import 'package:web/src/commons/themes.dart';
import 'package:web/src/routing/routing.dart';
import 'package:url_strategy/url_strategy.dart' as url_strategy;

import 'src/commons/strings.dart';

void main() async {
  url_strategy.setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  static const Key _materialAppKey = Key('Material App');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _materialAppKey,
      title: Strings.applicationName,
      navigatorKey: AppRouter.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        accentColor: AppColors.purpleMaterial,
        fontFamily: Strings.fontFamily,
        textTheme: AppTheme.textTheme,
        accentTextTheme: AppTheme.textTheme,
        primaryTextTheme: AppTheme.textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.jet,
          centerTitle: false,
        ),
      ),
    );
  }
}
