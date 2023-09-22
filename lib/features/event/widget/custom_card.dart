import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/appColors.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    this.image,
    this.height,
    this.width,
    this.title,
    this.subtitle,
    this.color,
  });
  Widget? image;
  double? height;
  double? width;
  String? title;
  String? subtitle;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
          height: height ?? 50,
          width: width ?? 50,
          decoration: BoxDecoration(color: color ?? AppColors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(12.r)),
        child: image
        // Image.asset(
        //   imagePath!,
        // ),
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}