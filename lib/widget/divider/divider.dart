import 'package:clover/common/app_colors.dart';
import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0.5, color: AppColors.divider_color,);
  }
}