import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue/flutter_blue.dart';

// Initiating instances and global variable for services
FlutterBlue fb = FlutterBlue.instance;
late List<BluetoothService> services;

//Wifi Service and Characteristics
final wifiUUID = "57694669-2050-726F-7669-73696F6E0000";

const ssidUUID = "57694669-2050-726F-7669-73696F6E0001";
const usidUUID = "57694669-2050-726F-7669-73696F6E0002";
const pswdUUID = "57694669-2050-726F-7669-73696F6E0003";

//ThingSpeak Service and Characteristics

// Bluetooth Connect Button for home page
class BLEConn extends StatefulWidget {
  const BLEConn({Key? key}) : super(key: key);

  @override
  _BLEConnState createState() => _BLEConnState();
}

class _BLEConnState extends State<BLEConn> {
  RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));
  EdgeInsets buttonPadding =
      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60);

  void _scanBLE() {
    fb.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (result.device.name == "UA-IOTENSR") {
          _connectBLE(result.device);
        }
      }
    });

    fb.startScan();
  }

  void _connectBLE(BluetoothDevice device) async {
    fb.stopScan();

    try {
      await device.connect();
    } catch (error) {
      throw ("Device already connected");
    }

    services = await device.discoverServices();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: const Icon(Icons.bluetooth),
        label: Text('BlueTooth Connect',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
        onPressed: () => _scanBLE(),
        style: ElevatedButton.styleFrom(
          padding: buttonPadding,
          shape: buttonRoundBorder,
          primary: Colors.lightBlue[600],
        ));
  }
}
