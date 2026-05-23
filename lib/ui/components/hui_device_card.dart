import 'package:flutter/material.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';
import 'package:heycyan_demo/ui/common/app_text_styles.dart';
import 'package:heycyan_demo/ui/components/hui_spinner.dart';
import 'package:heycyan_demo/ui/constants/assets_constants.dart';

class HuiDeviceCard extends StatelessWidget {
  final String name;
  final String macAddress;
  final String rssi;
  final VoidCallback? onTap;
  final bool isBusy;

  const HuiDeviceCard({
    Key? key,
    required this.name,
    required this.macAddress,
    required this.rssi,
    this.isBusy = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [kcCardBgLeft, kcCardBgRight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.4],
        ),
        border: Border.all(
          color: kcPrimaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Material(
        color: kcTransparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          // Disable taps if the card is already in a busy connection state
          onTap: isBusy ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Icon Avatar Container
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: kcwhite.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kcPrimaryColor.withOpacity(0.2)),
                  ),
                  // Center widget forces the child image to respect its 24x24 constraints
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        AssetsConstants.glassesIcon,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Text Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: ktsDeviceTitle),
                      const SizedBox(height: 4),
                      Text(macAddress, style: ktsDeviceMac),
                    ],
                  ),
                ),

                // Dynamic Trailing Element: Show HuiSpinner if busy, else show signal indicator
                isBusy
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: HuiSpinner(
                          color: kcPrimaryColor,
                          size: 20,
                        ),
                      )
                    : Row(
                        children: [
                          const Icon(
                            Icons.signal_cellular_alt,
                            color: kcPrimaryColor,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '$rssi dBm',
                            style: TextStyle(color: kcSignalText, fontSize: 14),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
