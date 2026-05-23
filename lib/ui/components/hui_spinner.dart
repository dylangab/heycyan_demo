import 'package:flutter/material.dart';
import 'package:heycyan_demo/ui/common/app_colors.dart';

class HuiSpinner extends StatelessWidget {
  final Color? color;
  final double size;
  const HuiSpinner({this.color, this.size = 20});

  @override
  Widget build(BuildContext context) => Center(
      child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(color ?? kcwhite))));
}
