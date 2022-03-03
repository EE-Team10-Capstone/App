import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:provider/provider.dart';

import 'package:app/providers/ble_provider.dart';

class WiFiPage extends StatefulWidget {
  const WiFiPage({Key? key}) : super(key: key);

  @override
  _WiFiPageState createState() => _WiFiPageState();
}

class _WiFiPageState extends State<WiFiPage> {
  RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));

  final _WifiKey = GlobalKey<FormState>();

  late TextEditingController _ssidController;
  late TextEditingController _useridController;
  late TextEditingController _passwdController;

  @override
  void initState() {
    super.initState();
    _ssidController = TextEditingController();
    _useridController = TextEditingController();
    _passwdController = TextEditingController();
  }

  @override
  void dispose() {
    _ssidController.dispose();
    _useridController.dispose();
    _passwdController.dispose();
    super.dispose();
  }

  void _wifiWrite() async {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _WifiKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Please insert your WiFi Credentials below',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                  ))),
          TextFormField(
            controller: _ssidController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'SSID'),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Please Enter an SSID';
              }
              return null;
            },
          ),
          TextFormField(
              controller: _useridController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Username'),
              validator: (text) {
                if (text == null || !text.isEmail()) {
                  return 'Please Enter a Valid School ID';
                }
                return null;
              }),
          TextFormField(
            controller: _passwdController,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Please Enter a Password';
              }
              return null;
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: buttonRoundBorder,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 100.0)),
                onPressed: () async {
                  if (_WifiKey.currentState!.validate()) {}
                },
                child: Text('Save',
                    style: Theme.of(context).textTheme.headline4!)),
          )
        ],
      ),
    );
  }
}
