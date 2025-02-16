// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/services.dart';
/*
Future<List<BTDeviceStruct>> findDevices() async {
  // FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  // Start scanning
  FlutterBluePlus.startScan(timeout: Duration(seconds: 5));

  // Wait for the scan to complete
  List<ScanResult> scanResults = [];

  FlutterBluePlus.scanResults.listen((results) {
    scanResults.addAll(results);
  });

  // Wait for scan to complete or timeout
  await Future.delayed(Duration(seconds: 6));

  // Stop scanning after the timeout
  FlutterBluePlus.stopScan();

  // Create a list of custom device structs
  List<BTDeviceStruct> devices = [];

  // Populate the devices list with ScanResults
  for (var deviceResult in scanResults) {
    devices.add(BTDeviceStruct(
      name: deviceResult.device.name,
      id: deviceResult.device.id.toString(),
      rssi: deviceResult.rssi,
    ));
  }

  return devices;
}
*/

Future<List<BTDeviceStruct>> findDevices() async {
  List<BTDeviceStruct> devices = [];
  List<ScanResult> scannedDevices = [];
  print("starting function");
  await FlutterBluePlus.startScan(timeout: Duration(seconds: 15));
  print("bluetooth scan start");
  var subscription = FlutterBluePlus.onScanResults.listen((results) {
    print("listening the results");
    for (ScanResult r in results) {
      if (r.device.name.isNotEmpty) {
        scannedDevices.add(r);
        print(r.device.name);
        FFAppState().temp = r.device.name;
      }
    }
  });

  FlutterBluePlus.cancelWhenScanComplete(subscription);
  print("subscription completed");
  await FlutterBluePlus.isScanning.where((val) => val == false).first;
  print("scannning done");
  //scannedDevices = scannedDevices.where((r) => r.device.name.isNotEmpty).toList();
  //scannedDevices.sort((a, b) => b.rssi.compareTo(a.rssi));

  devices.clear();
  scannedDevices.forEach((deviceResult) {
    print(deviceResult.device.name);
    print(deviceResult.device.id.toString());
    print(deviceResult.rssi);
    devices.add(BTDeviceStruct(
      name: deviceResult.device.name,
      id: deviceResult.device.id.toString(),
      rssi: deviceResult.rssi,
    ));
  });

  return devices;
}

/*
Future<List<BTDeviceStruct>> findDevices() async {
  return [
    BTDeviceStruct(name: "Device A", id: "00:11:22:33:44:55", rssi: -45),
    BTDeviceStruct(name: "Device B", id: "66:77:88:99:AA:BB", rssi: -50),
    BTDeviceStruct(name: "Device C", id: "CC:DD:EE:FF:00:11", rssi: -60),
    BTDeviceStruct(name: "Device D", id: "22:33:44:55:66:77", rssi: -70),
  ];
}
*/
