import 'dart:async';
import 'dart:convert' show utf8;

import 'package:flutter/material.dart';

import 'package:flutter_blue/flutter_blue.dart';
// import 'package:provider/provider.dart';

class BLE extends ChangeNotifier {
// Initiating instances and global variable for services
  FlutterBlue fb = FlutterBlue.instance;
  late List<BluetoothService> services;
  late BluetoothDevice ioTensor;
  BluetoothDeviceState ioTensorConnState = BluetoothDeviceState.disconnected;

//Go over stackoverflow example to find cleaner way to implement is connected
  bool isConnected = false;

//WiFi Service & Characteristics
  final String wifiUUID = "57694669-2050-726f-7669-73696f6e0000";
  final String ssidUUID = "57694669-2050-726F-7669-73696F6E0001";
  final String usidUUID = "57694669-2050-726F-7669-73696F6E0002";
  final String pswdUUID = "57694669-2050-726F-7669-73696F6E0003";
  final String wififlagchUUID = "57694669-2050-726F-7669-73696F6E0004";
  final String wififlagdsUUID = "57694669-2050-726F-7669-73696F6E0104";

//ThingSpeak Service & Characteristics
  final String tsUUID = "54532050-726F-7669-7369-6F6E00000000";
  final String wrapiUUID = "54532050-726F-7669-7369-6F6E00000001";

//Begin Sampling Service and Flag UUID
  final String bsUUID = "5C58C20C-B466-4A2E-A8AB-B66BADBBA000";
  final String bscharUUID = "5C58C20C-B466-4A2E-A8AB-B66BADBBA001";
  final String bsdescUUID = "5C58C20C-B466-4A2E-A8AB-B66BADBBA101";

// Scan for our Bluetooth device
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

// Connect to device specified in the scanresult listener
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

  // Future<int> wifiConnVerify(int wifiConnFlag) async {
  //   for (BluetoothService service in services) {
  //     if (service.uuid == Guid(wifiUUID)) {
  //       for (BluetoothCharacteristic characteristic
  //           in service.characteristics) {
  //         if (characteristic.uuid == Guid(wififlagchUUID)) {
  //           List<int> wifiFlags = await characteristic.read();
  //           wifiConnFlag = wifiFlags.single;
  //         }
  //       }
  //     }
  //   }
  //   return wifiConnFlag;
  // }

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
        }
      }
    }
  } // tsWrite end

  // void beginSampling() {
  //   for (BluetoothService service in services) {
  //     if (service.uuid == Guid(bsUUID)) {
  //       for (BluetoothCharacteristic characteristic
  //           in service.characteristics) {
  //             if
  //           }
  //     }
  //   }
  // }
}
