import 'package:heycyan_demo/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:heycyan_demo/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:heycyan_demo/ui/views/home/home_view.dart';
import 'package:heycyan_demo/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:heycyan_demo/services/hey_cyan_service.dart';
import 'package:heycyan_demo/ui/views/scan/scan_view.dart';
import 'package:heycyan_demo/ui/views/connected_device/connected_device_view.dart';
import 'package:heycyan_demo/services/permission_handler_service.dart';
import 'package:heycyan_demo/services/bluetooth_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ScanView),
    MaterialRoute(page: ConnectedDeviceView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HeyCyanService),
    LazySingleton(classType: PermissionHandlerService),
    LazySingleton(classType: BluetoothService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
