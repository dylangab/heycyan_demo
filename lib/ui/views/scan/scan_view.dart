import 'package:flutter/material.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';
import 'package:heycyan_demo/ui/common/app_text_styles.dart';
import 'package:heycyan_demo/ui/common/ui_helpers.dart';
import 'package:heycyan_demo/ui/components/hui_device_card.dart';
import 'package:heycyan_demo/ui/components/hui_shimmer_loading.dart';
import 'package:heycyan_demo/ui/components/hui_spinner.dart';
import 'package:heycyan_demo/ui/constants/assets_constants.dart';
import 'package:stacked/stacked.dart';

import 'scan_viewmodel.dart';

class ScanView extends StackedView<ScanViewModel> {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ScanViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: kcBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kcwhite),
            onPressed: () {
              viewModel.navigateBack();
            }),
        title: const Text('Scan', style: ktsAppBarTitle),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kcPrimaryColor.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            viewModel.refreshDiscovery();
          },
          backgroundColor: kcwhite,
          shape: const CircleBorder(),
          child: const Icon(Icons.refresh, color: kcBackgroundColor, size: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verticalSpace(30),
            Center(
                child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kcCircleContainerBg,
                border: Border.all(
                  color: kcPrimaryColor.withOpacity(0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: kcPrimaryColor.withOpacity(0.1),
                    blurRadius: 25,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Center(
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        AssetsConstants.glassesIcon,
                        fit: BoxFit.fill,
                      ))),
            )),
            verticalSpaceMedium,
            const Text('BLUETOOTH DISCOVERY ACTIVE', style: ktsStatusText),
            verticalSpace(24),
            if (viewModel.isBusy) ...[
              HuiShimmerLoading(height: 80, width: screenWidth(context)),
              verticalSpaceSmall,
              HuiShimmerLoading(height: 80, width: screenWidth(context)),
              verticalSpaceSmall,
              HuiShimmerLoading(height: 80, width: screenWidth(context)),
              verticalSpaceSmall,
            ],
            if (!viewModel.isBusy && viewModel.discoverdDevices.isEmpty) ...[
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: const Text('No Device Discoverd', style: ktsStatusText),
              ))
            ],
            if (!viewModel.isBusy && viewModel.discoverdDevices.isNotEmpty) ...[
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.discoverdDevices.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final device = viewModel.discoverdDevices[index];
                    return HuiDeviceCard(
                        isBusy: viewModel.isSelectedDeviceBusy &&
                            viewModel.isDeviceSelected(index),
                        name: device.displayName,
                        macAddress: device.macAddress,
                        rssi: device.rssi.toString(),
                        onTap: () {
                          viewModel.onSelectDevice(device);
                        });
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  ScanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScanViewModel();

  @override
  void onViewModelReady(ScanViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
