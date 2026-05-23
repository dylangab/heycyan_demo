import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:heycyan_demo/ui/constants/assets_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:heycyan_demo/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Container(
      height: screenHeight(context),
      width: screenWidth(context),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetsConstants.splashScreen,
              ),
              fit: BoxFit.fill)),
    ));
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
