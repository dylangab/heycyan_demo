import 'package:flutter/material.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';

enum HuiButtonSize { small, normal, large, auto }

class HuiButton extends StatelessWidget {
  final double? width;
  final bool enabled;
  final String title;
  final VoidCallback? onTap;
  final bool busy;
  final HuiButtonSize size;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final bool isOutline;
  final BorderRadius? borderRadius;

  const HuiButton({
    Key? key,
    this.enabled = true,
    required this.title,
    this.width,
    this.onTap,
    this.busy = false,
    this.isFullWidth = true,
    this.size = HuiButtonSize.normal,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.isOutline = false,
    this.borderRadius,
  }) : super(key: key);

  double? _getButtonHeight(HuiButtonSize size) {
    switch (size) {
      case HuiButtonSize.small:
        return 40;
      case HuiButtonSize.normal:
        return 58;
      case HuiButtonSize.large:
        return 64;
      case HuiButtonSize.auto:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? _getButtonHeight(size),
      width: isFullWidth ? double.infinity : width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: (backgroundColor ?? kcPrimaryColor).withOpacity(0.35),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: !enabled || busy ? null : onTap,
        color: isOutline ? kcTransparent : backgroundColor ?? kcPrimaryColor,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(100)),
        child: busy
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    color: kcBackgroundColor, strokeWidth: 2.5))
            : Text(
                title,
                style: TextStyle(
                  color: textColor ?? kcBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
      ),
    );
  }
}
