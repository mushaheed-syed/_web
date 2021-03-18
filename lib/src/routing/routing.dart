import 'package:flutter/material.dart'
    show
        BuildContext,
        GlobalKey,
        MaterialPageRoute,
        Navigator,
        NavigatorState,
        Route,
        RouteSettings,
        Widget;
import 'package:web/src/pages/contact_us.dart' show ContactUsPage;
import 'package:web/src/pages/home.dart' show HomePage;
import 'package:web/src/pages/under_development.dart';

import 'route_name.dart';

class AppRouter {
  AppRouter._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Widget _builder(BuildContext context, String? path) {
    switch (path) {
      case AppRouteName.contactUs:
      case $AppRouteName.contactUs:
        return const ContactUsPage();
      case AppRouteName.underDevelopment:
        return const UnderDevelopmentPage();
      case AppRouteName.root:
      default:
        return const HomePage();
    }
  }

  static Route<MaterialPageRoute>? _savedHomePageRoute;

  static Route<MaterialPageRoute>? get savedHomePageRoute =>
      _savedHomePageRoute;

  static Future<void> navigateHome(BuildContext context) async {
    if (savedHomePageRoute?.isActive ?? false) {
      Navigator.of(context).popUntil((route) => route == savedHomePageRoute);
    } else {
      await Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouteName.root,
        (route) => false,
      );
    }
  }

  static bool get hasHomePageRoute => savedHomePageRoute != null;

  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    final _path = settings.name;

    final Route<MaterialPageRoute> _pageRoute = MaterialPageRoute(
      builder: (context) => _builder(context, _path),
      settings: settings,
    );

    if (_path == AppRouteName.root) {
      _savedHomePageRoute = _pageRoute;
    }

    return _pageRoute;
  }
}
