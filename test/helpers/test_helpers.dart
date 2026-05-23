import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:heycyan_demo/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:heycyan_demo/services/hey_cyan_service.dart';
import 'package:heycyan_demo/services/permission_handler_service.dart';
import 'package:heycyan_demo/services/bluetooth_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<HeyCyanService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<PermissionHandlerService>(
        onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BluetoothService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
  ],
)
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterHeyCyanService();
  getAndRegisterPermissionHandlerService();
  getAndRegisterBluetoothService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(
    service.showCustomSheet<T, T>(
      enableDrag: anyNamed('enableDrag'),
      enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
      exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
      ignoreSafeArea: anyNamed('ignoreSafeArea'),
      isScrollControlled: anyNamed('isScrollControlled'),
      barrierDismissible: anyNamed('barrierDismissible'),
      additionalButtonTitle: anyNamed('additionalButtonTitle'),
      variant: anyNamed('variant'),
      title: anyNamed('title'),
      hasImage: anyNamed('hasImage'),
      imageUrl: anyNamed('imageUrl'),
      showIconInMainButton: anyNamed('showIconInMainButton'),
      mainButtonTitle: anyNamed('mainButtonTitle'),
      showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
      secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
      showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
      takesInput: anyNamed('takesInput'),
      barrierColor: anyNamed('barrierColor'),
      barrierLabel: anyNamed('barrierLabel'),
      customData: anyNamed('customData'),
      data: anyNamed('data'),
      description: anyNamed('description'),
    ),
  ).thenAnswer(
    (realInvocation) =>
        Future.value(showCustomSheetResponse ?? SheetResponse<T>()),
  );

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockHeyCyanService getAndRegisterHeyCyanService() {
  _removeRegistrationIfExists<HeyCyanService>();
  final service = MockHeyCyanService();
  locator.registerSingleton<HeyCyanService>(service);
  return service;
}

MockPermissionHandlerService getAndRegisterPermissionHandlerService() {
  _removeRegistrationIfExists<PermissionHandlerService>();
  final service = MockPermissionHandlerService();
  locator.registerSingleton<PermissionHandlerService>(service);
  return service;
}

MockBluetoothService getAndRegisterBluetoothService() {
  _removeRegistrationIfExists<BluetoothService>();
  final service = MockBluetoothService();
  locator.registerSingleton<BluetoothService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
