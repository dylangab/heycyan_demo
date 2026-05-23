import 'package:heycyan_demo/app/app.locator.dart';
import 'package:heycyan_demo/services/permission_handler_service.dart';

class InitService {
  static final _permissionHandlerservice = locator<PermissionHandlerService>();

  static Future<void> init() async {
    await initPermission();
  }

  static Future<void> initPermission() async {
    await _permissionHandlerservice.requestBluetoothPermissions();
  }
}
