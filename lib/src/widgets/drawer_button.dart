import 'dart:math' as math;

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

final _flipTransform = Matrix4.rotationY(math.pi);

class AppDrawerButton extends StatelessWidget {
  const AppDrawerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Transform(
        transform: _flipTransform,
        alignment: Alignment.center,
        child: const Icon(
          FluentIcons.list_28_filled,
        ),
      ),
      iconSize: 30,
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
