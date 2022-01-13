import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:google_fonts/google_fonts.dart';

class WiFiPage extends StatefulWidget {
  const WiFiPage({Key? key}) : super(key: key);

  @override
  _WiFiPageState createState() => _WiFiPageState();
}

class _WiFiPageState extends State<WiFiPage> {
  RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('Please insert your WiFi Credentials below',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                    ))),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'SSID'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: buttonRoundBorder,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 100.0)),
                  onPressed: () {},
                  child: Text('Save',
                      style: Theme.of(context).textTheme.headline4!)),
            )
          ],
        ),
      ),
    );
  }
}
