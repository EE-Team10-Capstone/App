import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:app_settings/app_settings.dart';
import 'package:google_fonts/google_fonts.dart';

import 'thingspeak.dart';
import 'wifi.dart';

void main() {
  // License for Montserrat font
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
          scheme: FlexScheme.deepBlue,
          textTheme: GoogleFonts.montserratTextTheme(
              ThemeData(brightness: Brightness.light).textTheme)),
      darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.deepBlue,
          textTheme: GoogleFonts.montserratTextTheme(
              ThemeData(brightness: Brightness.dark).textTheme)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)));
    EdgeInsets buttonPadding =
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60);

    return Scaffold(
      appBar: AppBar(
        title:
            Text('UA-IoTENSR', style: GoogleFonts.montserrat(fontSize: 36.0)),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.bluetooth),
              label: Text('BlueTooth Connect',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white)),
              onPressed: AppSettings.openBluetoothSettings,
              style: ElevatedButton.styleFrom(
                padding: buttonPadding,
                shape: buttonRoundBorder,
                primary: Colors.lightBlue[600],
              ),
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.settings),
              label: Text('Setup Menu',
                  style: Theme.of(context).textTheme.headline6!),
              style: OutlinedButton.styleFrom(
                  padding: buttonPadding,
                  shape: buttonRoundBorder,
                  primary: FlexColor.deepBlueDarkPrimaryVariant),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SetupMenu()));
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.done_outline_rounded),
              label: Text('Begin Sampling',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                  padding: buttonPadding, shape: buttonRoundBorder),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThingSpeakPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
