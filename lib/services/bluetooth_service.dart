import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';

class BluetoothService {
  final log = Logger();

  Future<void> turnOnBluetooth() async {
    try {
      await FlutterBluePlus.turnOn();
    } catch (e) {}
  }

  Future<bool> isBluetoothTurnedOn() async {
    if (await FlutterBluePlus.adapterState.first == BluetoothAdapterState.on) {
      return true;
    } else {
      return false;
    }
  }
}
