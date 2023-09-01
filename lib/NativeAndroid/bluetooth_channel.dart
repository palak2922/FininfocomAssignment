import 'package:flutter/services.dart';

class BluetoothChannel {
  static const MethodChannel _channel = MethodChannel('bluetooth_channel');

  static Future<void> enableBluetooth() async {
    try {
      await _channel.invokeMethod('enableBluetooth');
    } catch (e) {
      print('Error enabling Bluetooth: $e');
    }
  }
}
