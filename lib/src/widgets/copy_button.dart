import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/src/commons/strings.dart';

class CopyButton extends StatefulWidget {
  final ButtonStyle? actionButtonStyle;
  final bool iconButton;
  final String message;

  const CopyButton({
    Key? key,
    required this.message,
    required this.actionButtonStyle,
    this.iconButton = false,
  }) : super(key: key);

  @override
  _CopyButtonState createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool _hasCopied = false;

  bool get hasCopied => _hasCopied;

  void _copyIt() async {
    try {
      await Clipboard.setData(
        ClipboardData(text: widget.message),
      );
    } catch (_) {}

    setState(() {
      _hasCopied = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _actionButtonStyle = widget.actionButtonStyle ??
        OutlinedButton.styleFrom(
          primary: Colors.white,
        );

    if (widget.iconButton) {
      return IconButton(
        icon: Visibility(
          visible: !hasCopied,
          replacement: const Icon(FluentIcons.copy_24_filled),
          child: const Icon(FluentIcons.copy_24_regular),
        ),
        onPressed: _copyIt,
      );
    }

    return OutlinedButton.icon(
      onPressed: _copyIt,
      style: _actionButtonStyle,
      icon: const Icon(FluentIcons.copy_24_regular),
      label: Visibility(
        visible: !hasCopied,
        replacement: const Text(Strings.copied),
        child: const Text(Strings.copy),
      ),
    );
  }
}
