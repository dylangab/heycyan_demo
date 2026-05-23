import 'package:heycyan_demo/app/app.bottomsheets.dart';
import 'package:heycyan_demo/app/app.dialogs.dart';
import 'package:heycyan_demo/app/app.locator.dart';
import 'package:heycyan_demo/app/app.router.dart';
import 'package:heycyan_demo/services/hey_cyan_service.dart';
import 'package:heycyan_demo/ui/common/app_strings.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final log = Logger();
  final _navigationService = locator<NavigationService>();
  final _heyCyanService = locator<HeyCyanService>();

  void onNavigateToScanScreen() async {
    final result = await _navigationService.navigateToScanView();
    if (result != null) {}
  }
}
