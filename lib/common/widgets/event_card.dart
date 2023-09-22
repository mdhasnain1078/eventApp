import 'package:eventapp/common/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'image_fetcher.dart';

class EventCard extends StatelessWidget {
  EventCard(
      {this.dateTime,
      this.title,
      this.location,
      this.onTap,
      this.imageUrl,
      super.key});
  Widget? dateTime;
  Widget? title;
  Widget? location;
  VoidCallback? onTap;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            shadows: [
              BoxShadow(
                color: const Color(0x1152588F),
                blurRadius: 25.r,
                offset: Offset(0, 8.h),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 92.h,
                  width: 79.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: imageFetcher(imageUrl: imageUrl!),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text("Wed, Apr 28 • 5:30 PM", style: TextStyle(color: AppColors.blue, fontSize: 13, fontWeight: FontWeight.w400),),
                            dateTime ?? const Text(''),
                            SizedBox(
                              height: 5.h,
                            ),
                            // Text("Jo Malone London’s Mother’s Day Presents", style: TextStyle(color: AppColors.black, fontSize: 15, fontWeight: FontWeight.w500),)
                            title ?? const Text('')
                          ],
                        ),
                      ),
                      location != null
                          ? SizedBox(
                              height: 11.h,
                            )
                          : const SizedBox(),
                      location != null
                          ? Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/svg_icons/map-pin.svg',
                                  width: 14.w,
                                  height: 14.h,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(width: 200.w, child: location!)
                                // const Text("Radius Gallery • Santa Cruz, CA", style: TextStyle(color: AppColors.grey, fontSize: 13, fontWeight: FontWeight.w400),),
                              ],
                            )
                          : const Text("")
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
