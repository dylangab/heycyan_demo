import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:heycyan_demo/models/devices/glass_device.dart';
import 'glass_client.dart';

class RealGlassClient implements GlassClient {
  static const _channel = MethodChannel('com.example/heycyan');

  bool _isHeyCyanDevice(String name) {
    final lower = name.toLowerCase();
    return lower.contains('heycyan') ||
        lower.contains('cyan') ||
        name.startsWith('O_') ||
        name.startsWith('Q_');
  }

  @override
  Future<List<GlassDevice>> scan() async {
    try {
      final devices = <GlassDevice>[];

      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

      final subscription = FlutterBluePlus.scanResults.listen((results) {
        for (final r in results) {
          final name = r.device.platformName;
          if (name.trim().isEmpty) continue;
          if (!_isHeyCyanDevice(name)) continue;

          final exists = devices.any(
            (d) => d.macAddress == r.device.remoteId.str,
          );
          if (!exists) {
            devices.add(GlassDevice(
              macAddress: r.device.remoteId.str,
              name: name,
              rssi: r.rssi,
            ));
          }

          if (devices.length >= 30) FlutterBluePlus.stopScan();
        }
      });

      await FlutterBluePlus.isScanning
          .where((isScanning) => isScanning == false)
          .first;

      await subscription.cancel();

      return devices;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> connect(GlassDevice device) async {
    await _channel.invokeMethod('connect', {'mac': device.macAddress});
  }

  @override
  Future<Uint8List?> takePicture() async {
    final result = await _channel.invokeMethod<Uint8List>('takePicture');
    return result;
  }

  @override
  Future<void> disconnect() async {
    await _channel.invokeMethod('disconnect');
  }

  // @override
  // Future<String> testSdk() async {
  //   try {
  //     final result = await _channel.invokeMethod<String>('testSdk');
  //     return result ?? 'No response';
  //   } on PlatformException catch (e) {
  //     return '❌ Failed: ${e.message}';
  //   }
  // }
}
