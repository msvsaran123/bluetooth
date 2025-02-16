import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _bluetoothSupport = false;
  bool get bluetoothSupport => _bluetoothSupport;
  set bluetoothSupport(bool value) {
    _bluetoothSupport = value;
  }

  bool _bluetoothState = false;
  bool get bluetoothState => _bluetoothState;
  set bluetoothState(bool value) {
    _bluetoothState = value;
  }

  String _temp = 'temp';
  String get temp => _temp;
  set temp(String value) {
    _temp = value;
  }
}
