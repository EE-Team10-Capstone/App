import 'package:flutter/material.dart';

import 'package:app/screens/wifi.dart';
import 'package:app/screens/thingspeak.dart';

class SetupMenu extends StatefulWidget {
  const SetupMenu({Key? key}) : super(key: key);

  @override
  _SetupMenuState createState() => _SetupMenuState();
}

class _SetupMenuState extends State<SetupMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Setup Menu'),
                pinned: true,
                floating: true,
                forceElevated: boxIsScrolled,
                bottom: TabBar(
                  tabs: const [
                    Tab(icon: Icon(Icons.wifi), text: "WiFi Menu"),
                    Tab(icon: Icon(Icons.auto_graph), text: "ThingSpeak Menu")
                  ],
                  controller: _tabController,
                ),
              )
            ];
          },
          body: TabBarView(
            children: const <Widget>[
              WiFiPage(),
              ThingSpeakPage(),
            ],
            controller: _tabController,
          ),
        ));
  }
}
