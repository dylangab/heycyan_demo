// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'glass_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GlassDevice _$GlassDeviceFromJson(Map<String, dynamic> json) {
  return _GlassDevice.fromJson(json);
}

/// @nodoc
mixin _$GlassDevice {
  String get macAddress => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get rssi => throw _privateConstructorUsedError;
  bool get isMock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlassDeviceCopyWith<GlassDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlassDeviceCopyWith<$Res> {
  factory $GlassDeviceCopyWith(
          GlassDevice value, $Res Function(GlassDevice) then) =
      _$GlassDeviceCopyWithImpl<$Res, GlassDevice>;
  @useResult
  $Res call({String macAddress, String name, int rssi, bool isMock});
}

/// @nodoc
class _$GlassDeviceCopyWithImpl<$Res, $Val extends GlassDevice>
    implements $GlassDeviceCopyWith<$Res> {
  _$GlassDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macAddress = null,
    Object? name = null,
    Object? rssi = null,
    Object? isMock = null,
  }) {
    return _then(_value.copyWith(
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      isMock: null == isMock
          ? _value.isMock
          : isMock // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlassDeviceImplCopyWith<$Res>
    implements $GlassDeviceCopyWith<$Res> {
  factory _$$GlassDeviceImplCopyWith(
          _$GlassDeviceImpl value, $Res Function(_$GlassDeviceImpl) then) =
      __$$GlassDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String macAddress, String name, int rssi, bool isMock});
}

/// @nodoc
class __$$GlassDeviceImplCopyWithImpl<$Res>
    extends _$GlassDeviceCopyWithImpl<$Res, _$GlassDeviceImpl>
    implements _$$GlassDeviceImplCopyWith<$Res> {
  __$$GlassDeviceImplCopyWithImpl(
      _$GlassDeviceImpl _value, $Res Function(_$GlassDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macAddress = null,
    Object? name = null,
    Object? rssi = null,
    Object? isMock = null,
  }) {
    return _then(_$GlassDeviceImpl(
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      isMock: null == isMock
          ? _value.isMock
          : isMock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlassDeviceImpl extends _GlassDevice {
  const _$GlassDeviceImpl(
      {required this.macAddress,
      required this.name,
      required this.rssi,
      this.isMock = false})
      : super._();

  factory _$GlassDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlassDeviceImplFromJson(json);

  @override
  final String macAddress;
  @override
  final String name;
  @override
  final int rssi;
  @override
  @JsonKey()
  final bool isMock;

  @override
  String toString() {
    return 'GlassDevice(macAddress: $macAddress, name: $name, rssi: $rssi, isMock: $isMock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlassDeviceImpl &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.isMock, isMock) || other.isMock == isMock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, macAddress, name, rssi, isMock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlassDeviceImplCopyWith<_$GlassDeviceImpl> get copyWith =>
      __$$GlassDeviceImplCopyWithImpl<_$GlassDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlassDeviceImplToJson(
      this,
    );
  }
}

abstract class _GlassDevice extends GlassDevice {
  const factory _GlassDevice(
      {required final String macAddress,
      required final String name,
      required final int rssi,
      final bool isMock}) = _$GlassDeviceImpl;
  const _GlassDevice._() : super._();

  factory _GlassDevice.fromJson(Map<String, dynamic> json) =
      _$GlassDeviceImpl.fromJson;

  @override
  String get macAddress;
  @override
  String get name;
  @override
  int get rssi;
  @override
  bool get isMock;
  @override
  @JsonKey(ignore: true)
  _$$GlassDeviceImplCopyWith<_$GlassDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
