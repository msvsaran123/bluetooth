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

Future<bool> checkBluetoothState() async {
  if (isAndroid) {
    var subscription =
        FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      print(state);
      if (state == BluetoothAdapterState.on) {
        print("Bluetooth is ON");
        FFAppState().bluetoothState = true;
      } else {
        print("Bluetooth is OFF");
        FFAppState().bluetoothState = false;
      }
    });
    // subscription.cancel();
  }
  return true;
}
