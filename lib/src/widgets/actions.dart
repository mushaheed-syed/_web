import 'package:flutter/material.dart';
import 'package:web/src/commons/strings.dart';
import 'package:web/src/commons/themes.dart';
import 'package:web/src/routing/route_name.dart';
import 'package:web/src/routing/routing.dart';
import 'package:web/utils/mobile.dart';

import 'contact_now.dart';
import 'drawer_button.dart';

final _textButtonStyle = TextButton.styleFrom(
  primary: AppColors.lightGray,
);

const EdgeInsets _menuButtonPadding = EdgeInsets.symmetric(
  vertical: 4,
  horizontal: 4,
);

const _sizedBoxW4 = SizedBox(
  width: 4,
);

const _horizontalPadding = EdgeInsets.symmetric(
  horizontal: 12,
);

List<Widget> appBarActions(
  BuildContext context,
  SizeType sizeType,
) {
  final _isMediumLarge =
      sizeType.isSize(xxsmall: false, xsmall: false, small: false);

  final _isNotXSmall = sizeType.isSize(xxsmall: false, xsmall: false);

  final _modalRoute = ModalRoute.of(context);

  final _routeName = _modalRoute?.settings.name ?? '';

  return [
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isMediumLarge && _routeName != AppRouteName.root)
          TextButton(
            style: _textButtonStyle,
            onPressed: () {
              AppRouter.navigateHome(context);
            },
            child: Padding(
              padding: _menuButtonPadding,
              child: Text(
                Strings.home,
              ),
            ),
          ),
        if (_isMediumLarge) _sizedBoxW4,
        if (_isNotXSmall)
          TextButton(
            style: _textButtonStyle,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRouteName.underDevelopment,
              );
            },
            child: Padding(
              padding: _menuButtonPadding,
              child: Text(
                Strings.about,
              ),
            ),
          ),
        if (_isNotXSmall) _sizedBoxW4,
        if (_isMediumLarge)
          TextButton(
            style: _textButtonStyle,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRouteName.underDevelopment,
              );
            },
            child: Padding(
              padding: _menuButtonPadding,
              child: Text(
                Strings.projects,
              ),
            ),
          ),
        if (_isMediumLarge) _sizedBoxW4,
        if (_isNotXSmall)
          TextButton(
            style: _textButtonStyle,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRouteName.underDevelopment,
              );
            },
            child: Padding(
              padding: _menuButtonPadding,
              child: Text(
                Strings.details,
              ),
            ),
          ),
        if (_isNotXSmall) _sizedBoxW4,
        if (_isMediumLarge)
          Padding(
            padding: _horizontalPadding,
            child: ContactNowButton(),
          ),
        if (!_isMediumLarge && _isNotXSmall)
          ContactNowButton(
            buttonType: ContactNowButtonType.icon,
          ),
      ],
    ),
    const AppDrawerButton(),
  ];
}
