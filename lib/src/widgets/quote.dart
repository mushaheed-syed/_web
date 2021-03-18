import 'package:flutter/material.dart';
import 'package:web/src/commons/strings.dart';

const _topMarging = EdgeInsets.only(top: 50);

const _quotePadding = EdgeInsets.symmetric(
  horizontal: 34.0,
  vertical: 30.0,
);

class AppQuote extends StatelessWidget {
  const AppQuote() : super();

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      margin: _topMarging,
      padding: _quotePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            Strings.standOnTheShouldersOfGiants,
            style: _theme.textTheme.headline5?.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
          SelectableText(
            Strings.bernardOfChartes,
            style: _theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
