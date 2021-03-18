import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:web/src/commons/strings.dart';
import 'package:web/src/routing/route_name.dart';
import 'package:web/src/routing/routing.dart';

import 'contact_now.dart';

const _verticalPadding = EdgeInsets.symmetric(
  vertical: 12,
);

class AppEndDrawer extends StatelessWidget {
  const AppEndDrawer() : super();

  static void closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _modalRoute = ModalRoute.of(context);

    final _routeName = _modalRoute?.settings.name ?? '';

    final _drawerTextTheme = _theme.textTheme.copyWith(
      bodyText1: _theme.textTheme.bodyText1?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );

    final _drawerTheme = _theme.copyWith(
      textTheme: _drawerTextTheme,
    );

    return Drawer(
      child: Theme(
        data: _drawerTheme,
        child: ListView(
          children: [
            if (_routeName != AppRouteName.root)
              ListTile(
                title: Text(
                  Strings.home,
                ),
                onTap: () {
                  closeDrawer(context);
                  AppRouter.navigateHome(context);
                },
              ),
            ListTile(
              title: Text(
                Strings.about,
              ),
              onTap: () {
                closeDrawer(context);
                Navigator.of(context).pushNamed(
                  AppRouteName.underDevelopment,
                );
              },
            ),
            ListTile(
              title: Text(
                Strings.projects,
              ),
              onTap: () {
                closeDrawer(context);
                Navigator.of(context).pushNamed(
                  AppRouteName.underDevelopment,
                );
              },
            ),
            ListTile(
              title: Text(
                Strings.details,
              ),
              onTap: () {
                closeDrawer(context);
                Navigator.of(context).pushNamed(
                  AppRouteName.underDevelopment,
                );
              },
            ),
            if (_routeName != AppRouteName.contactUs)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: _verticalPadding,
                    child: ContactNowButton(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
