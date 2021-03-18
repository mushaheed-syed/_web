import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:web/src/commons/strings.dart';
import 'package:web/src/routing/route_name.dart';

enum ContactNowButtonType {
  fab,
  icon,
  regular,
}

const _contactButtonIcon = Icon(
  FluentIcons.call_24_regular,
);

const _contactButtonLabel = Text(
  Strings.contactNow,
);

const _contactButtonVerticalPadding4 = EdgeInsets.symmetric(vertical: 4.0);

class ContactNowButton extends StatelessWidget {
  final ContactNowButtonType buttonType;

  const ContactNowButton({
    Key? key,
    this.buttonType = ContactNowButtonType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _contactButtonAction() {
      Navigator.of(context).pushNamed(AppRouteName.contactUs);
    }

    switch (buttonType) {
      case ContactNowButtonType.fab:
        return FloatingActionButton.extended(
          onPressed: _contactButtonAction,
          icon: _contactButtonIcon,
          label: _contactButtonLabel,
        );
      case ContactNowButtonType.icon:
        return ElevatedButton(
          onPressed: _contactButtonAction,
          child: const Padding(
            padding: _contactButtonVerticalPadding4,
            child: _contactButtonIcon,
          ),
        );
      case ContactNowButtonType.regular:
      default:
        return ElevatedButton.icon(
          onPressed: _contactButtonAction,
          icon: const Padding(
            padding: _contactButtonVerticalPadding4,
            child: _contactButtonIcon,
          ),
          label: _contactButtonLabel,
        );
    }
  }
}
