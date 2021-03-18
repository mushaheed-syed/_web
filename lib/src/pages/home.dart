import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart'
    show FluentIcons;
import 'package:url_launcher/url_launcher.dart';

import 'package:web/src/commons/images.dart';
import 'package:web/src/commons/strings.dart';
import 'package:web/src/commons/themes.dart';
import 'package:web/src/model/technology.dart';
import 'package:web/src/routing/route_name.dart';
import 'package:web/src/widgets/actions.dart';
import 'package:web/src/widgets/contact_now.dart';
import 'package:web/src/widgets/end_drawer.dart';
import 'package:web/src/widgets/footer.dart';
import 'package:web/src/widgets/quote.dart';
import 'package:web/utils/mobile.dart';

const _buttonPadding = EdgeInsets.all(12);

class _OurFeatures extends StatelessWidget {
  final IconData icon;
  final Widget title;
  final Widget body;

  const _OurFeatures({
    Key? key,
    required this.icon,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _titleStyle = _theme.textTheme.headline6 ?? TextStyle(fontSize: 20);

    final _bodyStyle = _theme.textTheme.bodyText1 ?? TextStyle(fontSize: 16);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 320,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Icon(
                icon,
                size: 48,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 12.8,
              ),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: _titleStyle,
                child: title,
              ),
            ),
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: _bodyStyle,
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}

class _AllFeatures extends StatelessWidget {
  const _AllFeatures() : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 28.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: const [
          _OurFeatures(
            icon: FluentIcons.checkmark_48_filled,
            title: Text(Strings.agileApproach),
            body: Text(Strings.agileApproachBody),
          ),
          _OurFeatures(
            icon: FluentIcons.star_28_regular,
            title: Text(Strings.recieveOnTime),
            body: Text(Strings.recieveOnTimeBody),
          ),
          _OurFeatures(
            icon: FluentIcons.flash_on_24_filled,
            title: Text(Strings.quickDevelopment),
            body: Text(Strings.quickDevelopmentBody),
          ),
          _OurFeatures(
            icon: FluentIcons.handshake_24_filled,
            title: Text(Strings.versatile),
            body: Text(Strings.versatileBody),
          ),
          _OurFeatures(
            icon: FluentIcons.translate_24_regular,
            title: Text(Strings.intlable),
            body: Text(Strings.intlableBody),
          ),
        ],
      ),
    );
  }
}

class _OurFocus extends StatelessWidget {
  const _OurFocus() : super();

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 28,
      ),
      child: Text(
        Strings.ourFocus,
        textAlign: TextAlign.center,
        style: _theme.textTheme.headline6?.copyWith(
          color: AppColors.lightGray,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _CoverAndHeading extends StatelessWidget {
  const _CoverAndHeading() : super();

  @override
  Widget build(BuildContext context) {
    final _sizeType = SizeType.of(context);

    final _isVerySmall = _sizeType.isXXSmall;
    final _isMobileDevice = _sizeType.isXSmall;
    final _isTabletOrSmaller = _sizeType.isSmallOrXSmall;

    var _coverButtonPadding = _buttonPadding;
    double? _coverButtonFontSize;

    final _theme = Theme.of(context);

    var _textStyle = _theme.textTheme.headline2;

    if (_isVerySmall) {
      _coverButtonFontSize = 9.0;
      _textStyle = _theme.textTheme.headline5?.copyWith(
        fontWeight: FontWeight.bold,
      );
    } else if (_isMobileDevice) {
      _coverButtonPadding = const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      );
      _textStyle = _theme.textTheme.headline4;
    } else if (_isTabletOrSmaller) {
      _textStyle = _theme.textTheme.headline3;
    } else {
      //
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AppImages.cover,
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 28,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 960,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 18,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  child: Text(
                    Strings.letsWork,
                    textAlign: TextAlign.center,
                    style: _textStyle?.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ),
                if (!_isMobileDevice) const _OurFocus(),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRouteName.underDevelopment,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.darkGrayMaterial,
                      ),
                      child: Padding(
                        padding: _coverButtonPadding,
                        child: Text(
                          Strings.learnMore,
                          style: TextStyle(
                            // color: AppColors.jet,
                            fontSize: _coverButtonFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _isMobileDevice ? 0 : 8,
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRouteName.underDevelopment,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.jet,
                      ),
                      child: Padding(
                        padding: _coverButtonPadding,
                        child: Text(
                          Strings.seeProducts,
                          style: TextStyle(
                            fontSize: _coverButtonFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Technology extends StatelessWidget {
  final String iconPath;
  final Widget title;
  final String url;

  const _Technology({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.url,
  }) : super(key: key);

  void _openUrl() async {
    print('Will try to launch $url');

    final _canLaunch = await canLaunch(url);

    if (!_canLaunch) {
      print('Could not launch $url');
    }

    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _bodyStyle = _theme.textTheme.bodyText1 ?? TextStyle(fontSize: 16);

    final _size = 120.0;

    final _borderRadius = BorderRadius.circular(5);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Material(
              borderRadius: _borderRadius,
              elevation: 4,
              color: Colors.transparent,
              child: InkWell(
                onTap: _openUrl,
                borderRadius: _borderRadius,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size.square(_size)),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: _borderRadius,
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(iconPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          DefaultTextStyle(
            textAlign: TextAlign.center,
            style: _bodyStyle,
            child: title,
          ),
        ],
      ),
    );
  }
}

class _Technologies extends StatelessWidget {
  const _Technologies() : super();

  static const List<Technology> _technologies = [
    Technology(
      name: 'Flutter',
      imagePath: TechImagePath.flutter,
      hyperlink: 'https://flutter.dev/',
    ),
    Technology(
      name: 'Django',
      imagePath: TechImagePath.django,
      hyperlink: 'https://www.djangoproject.com/',
    ),
    Technology(
      name: 'Firebase',
      imagePath: TechImagePath.firebase,
      hyperlink: 'https://firebase.google.com/',
    ),
    Technology(
      name: 'Kotlin',
      imagePath: TechImagePath.kotlin,
      hyperlink: 'https://kotlinlang.org/',
    ),
    Technology(
      name: 'VueJs',
      imagePath: TechImagePath.vuejs,
      hyperlink: 'https://vuejs.org/',
    ),
    Technology(
      name: 'ReactJs',
      imagePath: TechImagePath.reactjs,
      hyperlink: 'https://reactjs.org/',
    ),
    Technology(
      name: 'NodeJs',
      imagePath: TechImagePath.nodejs,
      hyperlink: 'https://nodejs.org/',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final _sizeType = SizeType.of(context);

    final double _viewportFraction;

    if (_sizeType.isXLarge || _sizeType.isLarge) {
      _viewportFraction = 0.2;
    } else if (_sizeType.isMedium) {
      _viewportFraction = 0.3;
    } else if (_sizeType.isSmall) {
      _viewportFraction = 0.4;
    } else if (_sizeType.isXSmall) {
      _viewportFraction = 0.5;
    } else if (_sizeType.isXXSmall) {
      _viewportFraction = 0.6;
    } else {
      _viewportFraction = 0.3;
    }

    final _theme = Theme.of(context);

    final _bodyStyle = _theme.textTheme.headline6 ?? TextStyle(fontSize: 18);

    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'We offer services on',
          style: _bodyStyle,
        ),
        CarouselSlider.builder(
          itemCount: _technologies.length,
          itemBuilder: (context, index, realIndex) {
            final it = _technologies[index];
            return _Technology(
              title: Text(it.name),
              iconPath: it.imagePath,
              url: it.hyperlink,
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            disableCenter: true,
            viewportFraction: _viewportFraction,
            height: 210,
          ),
        ),
        Text(
          '... and more other excellent & emerging technologies',
          style: _theme.textTheme.bodyText2,
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _removeLoaderFromHtml();
  }

  /// Removes `loading` div from html
  ///
  /// Refer https://stackoverflow.com/a/63933407
  void _removeLoaderFromHtml() {
    final loader = document.getElementsByClassName('loading');
    if (loader.isNotEmpty) {
      loader.first.remove();
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _sizeType = SizeType.of(context);

    final _isVerySmall = _sizeType.isXXSmall;
    final _isMobileDevice = _sizeType.isXSmall;

    final _isNotXSmall = _sizeType.isSize(xxsmall: false, xsmall: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.applicationName),
        actions: appBarActions(context, _sizeType),
      ),
      floatingActionButton: Visibility(
        visible: !_isNotXSmall,
        child: const ContactNowButton(
          buttonType: ContactNowButtonType.fab,
        ),
      ),
      endDrawer: const AppEndDrawer(),
      body: CupertinoScrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          children: [
            const _CoverAndHeading(),
            Visibility(
              visible: _isMobileDevice,
              child: const _OurFocus(),
            ),
            const _AllFeatures(),
            const _Technologies(),
            const AppQuote(),
            const AppFooter(
              showLogo: false,
            ),
          ],
        ),
      ),
    );
  }
}
