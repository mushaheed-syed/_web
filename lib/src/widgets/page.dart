import 'package:flutter/cupertino.dart' show CupertinoScrollbar;
import 'package:flutter/material.dart';
import 'package:web/src/commons/tag.dart';

import 'drawer_button.dart';
import 'end_drawer.dart';
import 'footer.dart';

typedef PageChildrenBuilder = Widget Function(
  BuildContext context,
  GlobalKey<ScaffoldState> scaffoldKey,
);

class AppPage extends StatefulWidget {
  final String title;
  final PageChildrenBuilder builder;
  final bool showLearnMore;

  const AppPage({
    required this.title,
    required this.builder,
    this.showLearnMore = true,
  }) : super();

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController? _scrollController;
  final ScrollPhysics _scrollPhysics = ScrollPhysics();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [
          AppDrawerButton(),
        ],
      ),
      endDrawer: const AppEndDrawer(),
      body: CupertinoScrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          physics: _scrollPhysics,
          children: [
            widget.builder(context, scaffoldKey),
            AppFooter(
              showLearnMore: widget.showLearnMore,
            ),
          ],
        ),
      ),
    );
  }
}
