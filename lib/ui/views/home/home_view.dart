import 'package:flutter/material.dart';
import 'package:heycyan_demo/ui/common/app_text_styles.dart';
import 'package:heycyan_demo/ui/components/hui_button.dart';
import 'package:heycyan_demo/ui/constants/assets_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';
import 'package:heycyan_demo/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  verticalSpace(40),
                  Center(
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kcCircleContainerBg,
                        border: Border.all(
                          color: kcPrimaryColor.withOpacity(0.15),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kcPrimaryColor.withOpacity(0.12),
                            blurRadius: 40,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: Center(
                          child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          AssetsConstants.glassesIcon,
                          fit: BoxFit.fill,
                        ),
                      )),
                    ),
                  ),
                  verticalSpace(36),
                  const Text(
                    'HeyCyan',
                    style: ktsHeaderLarge,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(10),
                  const Text(
                    'SMART GLASS CONTROLLER',
                    style: ktsSubtitleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              HuiButton(
                  title: 'Connect',
                  busy: viewModel.isBusy,
                  onTap: () {
                    viewModel.onNavigateToScanScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
