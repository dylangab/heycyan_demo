// lib/client/glass_client.dart
import 'dart:typed_data';
import 'package:heycyan_demo/models/devices/glass_device.dart';

abstract class GlassClient {
  Future<List<GlassDevice>> scan();

  Future<void> connect(GlassDevice device);

  Future<Uint8List?> takePicture();

  Future<void> disconnect();

  //Future<String> testSdk();
}
