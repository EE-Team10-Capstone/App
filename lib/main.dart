// REMEMBER TO SHARE WHAT FLUTTER VERSION THE APP IS USING!!!

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:app/providers/ble_provider.dart';
import 'package:app/screens/home.dart';

void main() {
  // License for Montserrat font
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => BLE())],
    child: const MyApp(),
  ));
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
