import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService {
  Future<bool> requestBluetoothPermissions() async {
    // Android 12+ needs BLUETOOTH_SCAN and BLUETOOTH_CONNECT
    final results = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ].request();

    return results.values.every(
      (status) => status == PermissionStatus.granted,
    );
  }

  Future<bool> get bluetoothPermissionsGranted async {
    final scan = await Permission.bluetoothScan.isGranted;
    final connect = await Permission.bluetoothConnect.isGranted;
    final location = await Permission.locationWhenInUse.isGranted;
    return scan && connect && location;
  }
}
