import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<bool> sendBusinessMail(
  String senderEmail,
  String recipientEmail,
  String domain,
  String subject,
  String message,
  String name,
  String token,
) async {
  final username = 'api';
  final password = token;

  final basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  final _headers = {
    'Authorization': basicAuth,
    'Content-Type': 'application/json',
  };

  var url = Uri.parse(
    'https://api.mailgun.net/v3/$domain/messages',
  );

  var request = http.MultipartRequest('POST', url);

  request.headers.addAll(_headers);

  request.fields['from'] =
      '$name <$senderEmail>';
  request.fields['to'] = recipientEmail;
  request.fields['subject'] = subject;
  request.fields['text'] = message;

  print('Sending mail');

  StreamedResponse? response;

  try {
    response = await request.send();
  } catch (e, t) {
    print('$e\n$t');
  }

  print('Response status: ${response?.statusCode}');

  response?.stream.transform(utf8.decoder).listen((value) {
    print('Response body:');

    print(value);
  });

  return response?.statusCode == 200;
}
