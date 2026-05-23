import 'package:flutter/material.dart';
import 'package:heycyan_demo/models/devices/glass_device.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';
import 'package:heycyan_demo/ui/common/app_text_styles.dart';
import 'package:heycyan_demo/ui/common/ui_helpers.dart';
import 'package:heycyan_demo/ui/components/hui_button.dart';
import 'package:heycyan_demo/ui/components/hui_spinner.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stacked/stacked.dart';

import 'connected_device_viewmodel.dart';

class ConnectedDeviceView extends StackedView<ConnectedDeviceViewModel> {
  const ConnectedDeviceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConnectedDeviceViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcBackgroundColor,
        elevation: 0,
        title: const Text('Connected',
            style: TextStyle(
                color: kcwhite, fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedPowerOff,
              color: kcDisconnectIndicator,
            ),
            onPressed: () {
              viewModel.disconnectDevice();
            },
          ),
          horizontalSpaceSmall,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            verticalSpace(16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: kcChipBgConnected,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                            radius: 4, backgroundColor: kcPrimaryColor),
                        horizontalSpaceSmall,
                        Text(
                            'Connected to ${viewModel.connectedDevice?.displayName ?? ""}',
                            style: ktsChipText),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(32),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kcViewfinderBg,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: kcViewfinderBorder, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  // CustomPaint handles drawing the camera corner brackets
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (viewModel.isBusy) ...[
                          const HuiSpinner(),
                        ],
                        if (!viewModel.isBusy && viewModel.image == null) ...[
                          Icon(
                            Icons.camera_alt_outlined,
                            color: kcBracketColor.withOpacity(0.6),
                            size: 56,
                          ),
                          verticalSpace(16),
                          Text(
                            'NO PHOTO YET',
                            style: TextStyle(
                              color: kcBracketColor.withOpacity(0.8),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                        if (!viewModel.isBusy && viewModel.image != null) ...[
                          // Stack allows us to overlay a clear badge over the preview asset safely
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.file(
                                    viewModel.image!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                // Floating Action Badge to remove the captured frame
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      viewModel.removeImage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.2),
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(40),
            HuiButton(
              title: 'Take Picture',
              backgroundColor: kcDisconnectBtnBg,
              textColor: kcBackgroundColor,
              busy: viewModel.isBusy,
              onTap: () async {
                await viewModel.takePicture();
              },
              height: 60,
              borderRadius: BorderRadius.circular(100),
            ),
            verticalSpace(48),
          ],
        ),
      ),
    );
    ;
  }

  @override
  ConnectedDeviceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConnectedDeviceViewModel();
}
