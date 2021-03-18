import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:web/utils/send_mail.dart';

import 'generate_id.dart';

class Inquiry {
  final String name;
  final String email;
  final String message;

  Inquiry({
    required this.name,
    required this.email,
    required this.message,
  });

  bool _hasConfig = false;

  bool get hasConfig => _hasConfig;

  final Map<String, dynamic> _config = <String, dynamic>{};

  Future<void> _getConfig(BuildContext context) async {
    if (hasConfig) return;
    final _configRaw = await DefaultAssetBundle.of(context)
        .loadString('assets/mailer.config.v1.json');
    final _data = jsonDecode(_configRaw) as Map<String, dynamic>;
    _config.addAll(_data);
    _hasConfig = true;
  }

  Future<String> _sendMail() async {
    final _token = _config['key'] as String? ?? '';
    final _domain = _config['domain'] as String? ?? '';
    final _senderAddress = _config['sender_email'] as String? ?? '';
    final _recipientEmail = _config['recipient_email'] as String? ?? '';

    final _mailId = generateRandomId(email);

    final subject = 'Business inquiry from $name [$_mailId]';

    final contentValue = """$message


--
This mail was sent using sample project's forms.
Mail ID: $_mailId

Sent on behalf of $name,
$email.""";

    final _response = await sendBusinessMail(
      _senderAddress,
      _recipientEmail,
      _domain,
      subject,
      contentValue,
      name,
      _token,
    );

    if (!_response) {
      throw Exception('http failure');
    }

    return _mailId;
  }

  Future<String> send(BuildContext context) async {
    await _getConfig(context);
    return _sendMail();
  }
}
