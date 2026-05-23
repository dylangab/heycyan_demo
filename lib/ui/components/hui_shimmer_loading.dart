import 'package:flutter/material.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class HuiShimmerLoading extends StatelessWidget {
  const HuiShimmerLoading({
    super.key,
    required this.height,
    required this.width,
    this.baseColor,
    this.highlightColor,
    this.containerColor,
    this.margin,
    this.borderRadius,
  });

  final double height;
  final double width;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? containerColor;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? kcCardBgLeft,
      highlightColor: highlightColor ?? kcwhite,
      child: Container(
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
          color: containerColor ?? kcVeryLightGrey,
        ),
      ),
    );
  }
}
