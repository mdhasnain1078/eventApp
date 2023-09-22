import 'package:eventapp/common/helper/country_code_picker.dart';
import 'package:eventapp/common/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/helper/date_time_converter.dart';
import '../../../common/helper/show_dialogu.dart';
import '../../../common/widgets/image_fetcher.dart';
import '../widget/custom_card.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage(
      {super.key,
      required this.title,
      required this.description,
      required this.bannerImage,
      required this.dateTime,
      required this.organiserName,
      required this.organiserIcon,
      required this.venueName,
      required this.venueCity,
      required this.venueCountry});
  final String title;
  final String description;
  final String bannerImage;
  final String dateTime;
  final String organiserName;
  final String organiserIcon;
  final String venueName;
  final String venueCity;
  final String venueCountry;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isReadMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(alignment: Alignment.topCenter, children: [
                  SizedBox(
                    height: 244.h,
                    child: imageFetcher(imageUrl: widget.bannerImage),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 48.h, left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.white)),
                            const Text(
                              "Event Details",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                            height: 36.h,
                            width: 36.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white.withOpacity(0.2)),
                            child: Image.asset(
                              "assets/icons/images/batch.png",
                              height: 5.h,
                              width: 5.w,
                            ))
                      ],
                    ),
                  ),
                ]),
                SizedBox(
                  height: 21.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 35),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      CustomCard(
                        // image:SvgPicture.network(organiserIcon),
                        image: Image.network(widget.organiserIcon),
                        height: 48.h,
                        width: 48.w,
                        title: widget.organiserName,
                        subtitle: "Organizer",
                        color: AppColors.backgroundLight,
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      CustomCard(
                        image: Image.asset("assets/icons/images/calender.png"),
                        height: 48.h,
                        width: 48.w,
                        title: dataTimeFormateConverter3(widget.dateTime)['date'],
                        subtitle: dataTimeFormateConverter3(widget.dateTime)['time'],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      CustomCard(
                        image: Image.asset("assets/icons/images/location.png"),
                        height: 48.h,
                        width: 48.w,
                        title: widget.venueName,
                        subtitle: "${widget.venueCity},${getCountryCode(widget.venueCountry)}",
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      const Text(
                        "About Event",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(widget.description,
                          maxLines: isReadMore ? null : 4,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.6)),

                      if(isReadMore == false)
                          TextButton(
                          onPressed: () {
                            setState(() {
                              isReadMore = true;
                              print("Ok");
                            });
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text(
                            'Read More...',
                            style: TextStyle(
                              color: Color(0xFF5668FF),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.11,
                            ),
                          )),
                      SizedBox(height: isReadMore? 100.h:150),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          isReadMore ? const SizedBox(height: 0, width: 0,):
          Container(
            width: 375.w,
            height: 150.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [Colors.white.withOpacity(0.2), Colors.white],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 52.w),
        child: ElevatedButton(
            onPressed: () => showAlertDialog(
                context: context, message: "Your Event has book connect"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("BOOK NOW",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(
                  width: 50.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: CircleAvatar(
                    backgroundColor: AppColors.circularButtonColor,
                    radius: 15.r,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
