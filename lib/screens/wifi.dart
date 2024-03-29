import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  final _wifiKey = GlobalKey<FormState>();
  final _sharepreferences = SharedPreferences.getInstance();

  late TextEditingController _ssidController;
  late TextEditingController _useridController;
  late TextEditingController _passwdController;

  bool isReading = false;
  int wifiConnFlag = 0;
  int isWifiConnected = 0;

  Future<List<String?>> collectPrevSaved() async {
    // Waiting for the shared preference foler to be accessed
    final SharedPreferences sharedprefs = await _sharepreferences;

    String? prevSSID = sharedprefs.getString('ssid_saved');
    String? prevUserID = sharedprefs.getString('userid_saved');
    String? prevPassWD = sharedprefs.getString('passwd_saved');

    List<String?> prevSaved = [prevSSID, prevUserID, prevPassWD];
    return prevSaved;
  }

  @override
  void initState() {
    super.initState();
    _ssidController = TextEditingController();
    _useridController = TextEditingController();
    _passwdController = TextEditingController();

    collectPrevSaved();
  }

  @override
  void dispose() {
    _ssidController.dispose();
    _useridController.dispose();
    _passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bleProvider = context.watch<BLE>();

    return Form(
      key: _wifiKey,
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
          const SizedBox(height: 32),
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
          const SizedBox(height: 48),
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
          const SizedBox(
            height: 48,
          ),
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
          const SizedBox(height: 128),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: saveButton(bleProvider))
        ],
      ),
    );
  }

  Widget saveButton(BLE bleProvider) {
    return ElevatedButton.icon(
        icon: isReading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.0,
              )
            : const Icon(Icons.save),
        style: ElevatedButton.styleFrom(
            shape: buttonRoundBorder,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0)),
        onPressed: () async {
          setState(() {
            isReading = true;
          });
          // Write Characteristics from the app to the device
          if (_wifiKey.currentState!.validate()) {
            bleProvider.wifiWrite(_ssidController.text, _useridController.text,
                _passwdController.text);
          }

          // Read the wifi connect flag from the device
          await Future.delayed(const Duration(seconds: 15), () async {
            isWifiConnected = await bleProvider.wifiConnVerify(wifiConnFlag);
          });

          // Take result from connect flag and display result to user
          _wifiVerify(isWifiConnected);

          setState(() {
            isReading = false;
          });
        },
        label: Text('Save', style: Theme.of(context).textTheme.headline4!));
  }

  void _wifiVerify(int isWifiConnected) {
    if (isWifiConnected == 1) {
      showDialog(
        context: context,
        builder: (_) => connectedAlert(),
        barrierDismissible: true,
      );
    } else if (isWifiConnected == 0) {
      showDialog(
        context: context,
        builder: (_) => notconnectedAlert(),
        barrierDismissible: true,
      );
    }
  }

  Widget connectedAlert() {
    return const AlertDialog(
      title: Text("Device WiFi Connection"),
      content: Text("WiFi Connection Successful"),
    );
  }

  Widget notconnectedAlert() {
    return const AlertDialog(
      title: Text("Device WiFi Connection"),
      content: Text(
          "WiFi Connection Unsuccessful. Please confirm credentials and try again"),
    );
  }
}
