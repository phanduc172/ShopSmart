import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_smart/widgets/title_text.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, required this.fontSize});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 30),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: TitleTextWidget(label: "Shop Smart"),
    );
  }
}
