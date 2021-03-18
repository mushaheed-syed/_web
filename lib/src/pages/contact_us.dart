import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/src/commons/strings.dart';
import 'package:web/src/widgets/copy_button.dart';
import 'package:web/utils/post_query.dart';
import 'package:web/src/widgets/page.dart';

class _ComposeMail extends StatefulWidget {
  @override
  __ComposeMailState createState() => __ComposeMailState();
}

class __ComposeMailState extends State<_ComposeMail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _messageController;

  String get _clientName => _nameController?.text.trim() ?? '';
  String get _clientEmail => _emailController?.text.toLowerCase() ?? '';
  String get _clientMessage => _messageController?.text ?? '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _emailController?.dispose();
    _messageController?.dispose();
    super.dispose();
  }

  static bool _isValid(String pattern, String value) {
    return RegExp(pattern).hasMatch(value);
  }

  static String? _nameValidator(String? value) {
    if (value?.isEmpty ?? true) return 'Provide a name';
    final _pattern = r'^(?![\s.]+$)[a-zA-Z\s.]*$';
    final _valid = _isValid(_pattern, value!);
    if (!_valid) return 'Provide a valid name';
    return null;
  }

  static String? _emailValidator(String? value) {
    if (value?.isEmpty ?? true) return 'Provide your email';
    final _pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final _valid = _isValid(_pattern, value!);
    if (!_valid) return 'Provide a valid email';
    return null;
  }

  static String? _messageValidator(String? value) {
    if (value?.isEmpty ?? true) return 'Write your message';
    return null;
  }

  void _openMailClient() async {
    final _body = '''$_clientMessage



$_clientName,
$_clientEmail''';

    final _uri = Uri(
      path: '_',
      queryParameters: <String, String>{
        'subject': 'Business inquiry',
        'body': _body,
      },
    );
    final _url = 'mailto:business@${_uri.toString()}';

    print('Will try to launch $_url');

    final _canLaunch = await canLaunch(_url);

    if (!_canLaunch) {
      print('Could not launch $_url');
    }

    await launch(_url);
  }

  String _referenceId = '';

  bool _hasSent = false;

  bool get hasSent => _referenceId.isNotEmpty && _hasSent;

  String get _inquirySentWith {
    return '${Strings.inquirySentWith} $_referenceId.';
  }

  bool _isSending = false;

  void _sendMessage() async {
    final _isValid = _formKey.currentState?.validate() ?? false;

    if (!_isValid) return;

    setState(() {
      _isSending = true;
    });

    try {
      final inquiry = Inquiry(
        email: _clientEmail,
        message: _clientMessage,
        name: _clientName,
      );

      _referenceId = await inquiry.send(context);
      setState(() {
        _isSending = false;
        _hasSent = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            Strings.inquirySent,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: const Duration(seconds: 10),
        ),
      );
    } catch (e, t) {
      print('$e\n$t');

      setState(() {
        _isSending = false;
      });

      _openMailClient();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _labelStyle = TextStyle(
      color: Colors.white,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 40.0,
      ),
      child: Form(
        key: _formKey,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 650,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.writeToUs,
                style: _theme.textTheme.headline4?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (_hasSent)
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(
                      FluentIcons.checkmark_48_filled,
                      color: Colors.green,
                    ),
                    title: SelectableText(
                      _inquirySentWith,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: SelectableText(
                      Strings.ifYouDontHear,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameController,
                validator: _nameValidator,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: _labelStyle,
                  hintText: 'Your name',
                ),
                autofillHints: [
                  AutofillHints.name,
                  AutofillHints.givenName,
                  AutofillHints.nickname,
                ],
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                validator: _emailValidator,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: _labelStyle,
                  hintText: 'Your email',
                ),
                autofillHints: [
                  AutofillHints.email,
                ],
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _messageController,
                validator: _messageValidator,
                decoration: InputDecoration(
                  hintText: 'Your Message',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                onPressed: _isSending ? null : _sendMessage,
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    bottom: 8.0,
                  ),
                  child: _isSending
                      ? SizedBox.fromSize(
                          size: Size.square(15),
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                          ),
                        )
                      : Icon(FluentIcons.send_28_filled),
                ),
                label: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    _isSending ? Strings.sendingMessage : Strings.sendMessage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactEmail extends StatelessWidget {
  static void _sendDirectly() async {
    final _uri = Uri(
      path: '_',
      queryParameters: <String, String>{
        'subject': 'Business inquiry',
        'body': '',
      },
    );
    final _url = 'mailto:business@${_uri.toString()}';

    print('Will try to launch $_url');

    final _canLaunch = await canLaunch(_url);

    if (!_canLaunch) {
      print('Could not launch $_url');
    }

    await launch(_url);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _actionButtonStyle = OutlinedButton.styleFrom(
      primary: Colors.white,
    );

    return Column(
      children: [
        const Icon(
          FluentIcons.mail_48_filled,
          color: Colors.blueGrey,
          size: 70,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: SelectableText(
            Strings.contactEmail,
            textAlign: TextAlign.center,
            style: _theme.textTheme.headline4?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              CopyButton(
                message: Strings.contactEmail,
                actionButtonStyle: _actionButtonStyle,
              ),
              const SizedBox(
                width: 8,
              ),
              OutlinedButton.icon(
                onPressed: _sendDirectly,
                style: _actionButtonStyle,
                icon: const Icon(FluentIcons.send_28_regular),
                label: const Text(Strings.openMail),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage() : super();

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return AppPage(
      title: Strings.contactUs,
      builder: (context, scaffoldKey) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 24.0,
          ),
          child: Column(
            children: [
              Text(
                Strings.dontHesitate,
                textAlign: TextAlign.center,
                style: _theme.textTheme.headline3?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _ContactEmail(),
                    // _ContactPhone(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              Strings.or,
                              style: _theme.textTheme.headline4,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    _ComposeMail(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
