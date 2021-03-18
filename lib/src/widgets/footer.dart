import 'package:flutter/material.dart';
import 'package:web/src/commons/strings.dart';
import 'package:web/src/commons/themes.dart';

const _buttonPadding = EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 12,
);

const _logoPadding = EdgeInsets.symmetric(
  horizontal: 6,
  vertical: 6,
);

class AppFooter extends StatelessWidget {
  final bool showLogo;
  final bool showLearnMore;

  const AppFooter({
    this.showLogo = true,
    this.showLearnMore = true,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 34.0,
            vertical: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: showLearnMore,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.grow,
                      style: _theme.textTheme.headline2,
                    ),
                    Text(
                      Strings.businessTeam,
                      style: _theme.textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.lightGray,
                      ),
                      child: Padding(
                        padding: _buttonPadding,
                        child: Text(
                          Strings.learnMore,
                          style: TextStyle(
                            color: AppColors.jet,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
