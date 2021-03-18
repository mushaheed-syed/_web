import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:web/src/commons/strings.dart';
import 'package:web/src/routing/routing.dart';
import 'package:web/src/widgets/page.dart';

class UnderDevelopmentPage extends StatelessWidget {
  const UnderDevelopmentPage();

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AppPage(
      title: Strings.sad,
      showLearnMore: false,
      builder: (BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 300.0,
            horizontal: 26,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(
                    FluentIcons.window_dev_tools_24_filled,
                    size: 100,
                  ),
                  Icon(
                    FluentIcons.add_28_filled,
                    size: 40,
                  ),
                  Icon(
                    FluentIcons.toolbox_28_regular,
                    size: 100,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                Strings.underConstruction,
                textAlign: TextAlign.center,
                style: _theme.textTheme.headline5,
              ),
              const SizedBox(
                height: 12,
              ),
              OutlinedButton(
                onPressed: () {
                  AppRouter.navigateHome(context);
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text(Strings.goHome),
              ),
            ],
          ),
        );
      },
    );
  }
}
