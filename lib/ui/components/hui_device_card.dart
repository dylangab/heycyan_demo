import 'package:flutter/material.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';
import 'package:heycyan_demo/ui/common/app_text_styles.dart';
import 'package:heycyan_demo/ui/constants/assets_constants.dart';

class HuiDeviceCard extends StatelessWidget {
  final String name;
  final String macAddress;
  final String rssi;
  final VoidCallback? onTap;

  const HuiDeviceCard({
    Key? key,
    required this.name,
    required this.macAddress,
    required this.rssi,
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
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Icon Avatar
                Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: kcwhite.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: kcPrimaryColor.withOpacity(0.2)),
                    ),
                    child: SizedBox(
                        width: 15,
                        height: 15,
                        child: Image.asset(
                          AssetsConstants.glassesIcon,
                          fit: BoxFit.fill,
                        ))),

                SizedBox(
                  width: 16,
                ),
                // Text Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: ktsDeviceTitle),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(macAddress, style: ktsDeviceMac),
                    ],
                  ),
                ),

                Row(
                  children: [
                    const Icon(Icons.signal_cellular_alt,
                        color: kcPrimaryColor, size: 16),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('$rssi dBm',
                        style: TextStyle(color: kcSignalText, fontSize: 14)),
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
