import 'package:eventapp/common/utils/appColors.dart';
import 'package:eventapp/common/widgets/event_card.dart';
import 'package:eventapp/features/event/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/helper/address_formatter.dart';
import '../../../common/helper/date_time_converter.dart';
import '../../../common/routes/routes.dart';

class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              SizedBox(
                width: 31.w,
              ),
              const Text(
                "Events",
                style: TextStyle(color: AppColors.black),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(Routes.search),
              child: SvgPicture.asset(
                'assets/icons/svg_icons/search.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            const Icon(
              Icons.more_vert,
              color: AppColors.black,
            ),
             SizedBox(
              width: 24.w,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ref.watch(eventDataProvider).when(data: (data){
            return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, i) => EventCard(
              onTap: (){
                Navigator.pushNamed(context, Routes.detail, arguments: {
                  "title": data[i].title,
                  "bannerImage": data[i].bannerImage,
                  "dateTime": data[i].dateTime,
                  "venueName": data[i].venueName,
                  "venueCity": data[i].venueCity,
                  "venueCountry": data[i].venueCountry,
                  "organiserName": data[i].organiserName,
                  "organiserIcon": data[i].organiserIcon,
                  "description": data[i].description,
                });
              },
              imageUrl: data[i].bannerImage,
              dateTime:  Text(
                // "Wed, Apr 28 • 5:30 PM"
                dataTimeFormateConverter1(data[i].dateTime),
                style: const TextStyle(
                    color: AppColors.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              title: Text(
                data[i].title,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              location: Text(
                // "Radius Gallery • Santa Cruz, CA"
                addressFormatter(data[i].venueName, data[i].venueCity, data[i].venueCountry),
                overflow: TextOverflow.ellipsis,
                 maxLines: 1,
                style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
            SizedBox(
              height: 12.h,
            ),
          );
          }, error: (s, t){
            return const Center(child: Text("Unable to load"),);
          }, loading: (){
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          })
          
        ));
  }
}
