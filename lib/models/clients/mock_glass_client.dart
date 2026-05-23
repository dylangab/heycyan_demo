// lib/client/mock_glass_client.dart
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:heycyan_demo/models/devices/glass_device.dart';
import 'package:heycyan_demo/ui/constants/assets_constants.dart';
import 'glass_client.dart';

class MockGlassClient implements GlassClient {
  @override
  Future<List<GlassDevice>> scan() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      const GlassDevice(
        macAddress: 'AA:BB:CC:DD:EE:01',
        name: 'Q_W610',
        rssi: -65,
        isMock: true,
      ),
      const GlassDevice(
        macAddress: 'AA:BB:CC:DD:EE:02',
        name: 'O_G300',
        rssi: -72,
        isMock: true,
      ),
      const GlassDevice(
        macAddress: 'AA:BB:CC:DD:EE:03',
        name: 'Q_M01S',
        rssi: -80,
        isMock: true,
      ),
    ];
  }

  @override
  Future<void> connect(GlassDevice device) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<Uint8List> takePicture() async {
    await Future.delayed(const Duration(seconds: 1));
    final byteData = await rootBundle.load(AssetsConstants.demoImage);
    return byteData.buffer.asUint8List();
  }

  @override
  Future<void> disconnect() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // @override
  // Future<String> testSdk() async {
  //   return "";
  // }
}
