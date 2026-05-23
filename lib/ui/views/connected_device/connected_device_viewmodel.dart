import 'dart:io';

import 'package:heycyan_demo/app/app.locator.dart';
import 'package:heycyan_demo/helpers/image_helper.dart';
import 'package:heycyan_demo/models/devices/glass_device.dart';
import 'package:heycyan_demo/services/hey_cyan_service.dart';
import 'package:heycyan_demo/ui/constants/assets_constants.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConnectedDeviceViewModel extends BaseViewModel {
  final log = Logger();
  final _navigationService = locator<NavigationService>();
  final _heyCyanService = locator<HeyCyanService>();

  GlassDevice? get connectedDevice => _heyCyanService.connectedDevice;

  File? image;

  Future<void> disconnectDevice() async {
    await _heyCyanService.disconnect();
    onBack();
  }

  Future<void> takePicture() async {
    setBusy(true);
    final result = await _heyCyanService.takePicture();
    if (result != null) {
      var photo = await ImageHelper()
          .convertUint8ListToFile(result, DateTime.now().toString());
      setImage(photo);
    } else {}
    notifyListeners();
    setBusy(false);
  }

  void setImage(File file) {
    image = file;
    notifyListeners();
  }

  void onBack() {
    _navigationService.back(result: true);
  }

  void removeImage() {
    image = null;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_heyCyanService];
}
