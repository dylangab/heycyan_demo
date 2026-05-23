import 'package:flutter/services.dart';
import 'package:heycyan_demo/models/clients/glass_client.dart';
import 'package:heycyan_demo/models/clients/mock_glass_client.dart';
import 'package:heycyan_demo/models/clients/real_glass_client.dart';
import 'package:heycyan_demo/models/devices/glass_device.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class HeyCyanService with ListenableServiceMixin {
  final log = Logger();
  GlassClient _client = RealGlassClient();
  GlassClient _mockClient = MockGlassClient();
  GlassDevice? _connectedDevice;

  GlassDevice? get connectedDevice => _connectedDevice;

  Future<List<GlassDevice>> scan() async {
    final results = await _client.scan();

    if (results.isEmpty) {
      return await _mockClient.scan();
    }

    return results;
  }

  Future<void> connect(GlassDevice device) async {
    await _mockClient.connect(device);
    setConnectedDevice(device);
  }

  Future<Uint8List?> takePicture() async {
    return await _mockClient.takePicture();
  }

  Future<void> disconnect() async {
    await _client.disconnect();
    _connectedDevice = null;
  }

  void setConnectedDevice(GlassDevice device) {
    _connectedDevice = device;
    notifyListeners();
  }

  // Future<void> testSdk() async {
  //   final result = await _client.testSdk();
  //   log.e(result);
  // }
}
