// lib/models/glass_device.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'glass_device.freezed.dart';
part 'glass_device.g.dart';

@freezed
class GlassDevice with _$GlassDevice {
  const GlassDevice._();

  const factory GlassDevice({
    required String macAddress,
    required String name,
    required int rssi,
    @Default(false) bool isMock,
  }) = _GlassDevice;

  String get displayName {
    if (name.startsWith('O_') || name.startsWith('Q_')) {
      return name.substring(2);
    }
    return name;
  }

  factory GlassDevice.fromJson(Map<String, dynamic> json) =>
      _$GlassDeviceFromJson(json);
}
