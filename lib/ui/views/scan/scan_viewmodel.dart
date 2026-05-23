import 'package:heycyan_demo/app/app.locator.dart';
import 'package:heycyan_demo/app/app.router.dart';
import 'package:heycyan_demo/models/devices/glass_device.dart';
import 'package:heycyan_demo/services/hey_cyan_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ScanViewModel extends BaseViewModel {
  final log = Logger();
  final _navigationService = locator<NavigationService>();
  final _heyCyanService = locator<HeyCyanService>();

  List<GlassDevice> _discoverdDevices = [];
  List<GlassDevice> get discoverdDevices => _discoverdDevices;

  void init() async {
    await startDiscovery();
  }

  Future<void> startScan() async {
    final result = await _heyCyanService.scan();
    if (result != null) {
      setDiscoverdDevices(result);
    }
  }

  Future<void> startDiscovery() async {
    setBusy(true);
    // await Future.delayed(const Duration(seconds: 5));
    await startScan();
    setBusy(false);
  }

  void refreshDiscovery() {
    setBusy(true);
    _discoverdDevices.clear();
    Future.delayed(const Duration(milliseconds: 1000), () {
      startDiscovery();
    });
  }

  void onSelectDevice(GlassDevice device) async {
    await connectToDevice(device);
    _navigationService.navigateToConnectedDeviceView();
  }

  void setDiscoverdDevices(List<GlassDevice> value) {
    _discoverdDevices = value;
    notifyListeners();
  }

  Future<void> connectToDevice(GlassDevice device) async {
    await _heyCyanService.connect(device);
  }

  void navigateBack() {
    _navigationService.back();
  }
}
