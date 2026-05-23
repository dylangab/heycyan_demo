// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glass_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlassDeviceImpl _$$GlassDeviceImplFromJson(Map<String, dynamic> json) =>
    _$GlassDeviceImpl(
      macAddress: json['macAddress'] as String,
      name: json['name'] as String,
      rssi: (json['rssi'] as num).toInt(),
      isMock: json['isMock'] as bool? ?? false,
    );

Map<String, dynamic> _$$GlassDeviceImplToJson(_$GlassDeviceImpl instance) =>
    <String, dynamic>{
      'macAddress': instance.macAddress,
      'name': instance.name,
      'rssi': instance.rssi,
      'isMock': instance.isMock,
    };
