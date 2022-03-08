import 'dart:async';
import 'dart:convert' show utf8;

import 'package:flutter/material.dart';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';

// Initiating instances and global variable for services

//Wifi Service and Characteristics

//ThingSpeak Service and Characteristics

// Bluetooth Connect Button for home page

class BLE extends ChangeNotifier {
  FlutterBlue fb = FlutterBlue.instance;
  late List<BluetoothService> services;

  late String serviceuuid;

  bool isConnected = false;

  // WiFi Characteristics
  final String wifiUUID = "57694669-2050-726f-7669-73696f6e0000";
  final String ssidUUID = "57694669-2050-726F-7669-73696F6E0001";
  final String usidUUID = "57694669-2050-726F-7669-73696F6E0002";
  final String pswdUUID = "57694669-2050-726F-7669-73696F6E0003";

// ThingSpeak Characteristics Insert when completed
  final String tsUUID = "54532050-726F-7669-7369-6F6E00000000";
  final String wrapiUUID = "54532050-726F-7669-7369-6F6E00000001";

  scanBLE() {
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

  void wifiWrite(String ssid, String userid, String passwd) async {
    for (BluetoothService service in services) {
      if (service.uuid == Guid(wifiUUID)) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.uuid == Guid(ssidUUID)) {
            characteristic.write(utf8.encode(ssid));
          }
          if (characteristic.uuid == Guid(usidUUID)) {
            Future.delayed(const Duration(milliseconds: 2000), () {
              characteristic.write(utf8.encode(userid));
            });
          }
          if (characteristic.uuid == Guid(pswdUUID)) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              characteristic.write(utf8.encode(passwd));
            });
          }
        }
      }
    }
  }

  void tsWrite(
      String
          wrapikey /*, String cochan, String tempchan, String rhchan*/) async {
    for (BluetoothService service in services) {
      if (service.uuid == Guid(tsUUID)) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.uuid == Guid(wrapiUUID)) {
            characteristic.write(utf8.encode(wrapikey));
          }
          // if (characteristic.uuid == Guid(usidUUID)) {
          //   Future.delayed(const Duration(milliseconds: 2000), () {
          //     characteristic.write(utf8.encode(userid));
          //   });
          // }
          // if (characteristic.uuid == Guid(pswdUUID)) {
          //   Future.delayed(const Duration(milliseconds: 1000), () {
          //     characteristic.write(utf8.encode(passwd));
          //   });
          //}
        }
      }
    }
  }
}
