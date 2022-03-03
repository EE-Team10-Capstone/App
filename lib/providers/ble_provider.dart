import 'dart:async';

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

  bool isConnected = false;

  // WiFi Characteristics
  final String wifiUUID = "57694669-2050-726F-7669-73696F6E0000";
  final String ssidUUID = "57694669-2050-726F-7669-73696F6E0001";
  final String usidUUID = "57694669-2050-726F-7669-73696F6E0002";
  final String pswdUUID = "57694669-2050-726F-7669-73696F6E0003";

// ThingSpeak Characteristics Insert when completed

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
      if (service.uuid.toString() == wifiUUID) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          //switch (characteristic.uuid) {
          //case ssidUUID:
          //  await characteristic.write(ssid);
          //  break;
          //}
        }
      }
    }
  }
}
