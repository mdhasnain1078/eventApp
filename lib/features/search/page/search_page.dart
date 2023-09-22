import 'package:eventapp/common/models/event_model.dart';
import 'package:eventapp/common/utils/appColors.dart';
import 'package:eventapp/common/widgets/event_card.dart';
import 'package:eventapp/features/search/widget/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/helper/date_time_converter.dart';
import '../../../common/routes/routes.dart';
import '../controller/search_controller.dart';
import '../repository/search_notifier.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});
  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _searchNode = FocusNode();
  bool isDirected = true;
  final searchControlller = TextEditingController();

  @override
  void didChangeDependencies() {
    if (isDirected) {
      FocusScope.of(context).requestFocus(_searchNode);
    }
    isDirected = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchNode.dispose();
    searchControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                color: AppColors.black),
          ),
          title: Row(
            children: const [
              Text(
                "Search",
                style: TextStyle(color: AppColors.black),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                height: 32.h,
                child: CustomTextField(
                  controller: searchControlller,
                  onFieldSubmitted: (value) {
                    ref
                        .watch(searchStateNotifierProvider.notifier)
                        .fetchData(value);
                  },
                  focusNode: _searchNode,
                  keyboardType: TextInputType.text,
                  hintText: "Type Event Name",
                  textAlign: TextAlign.left,
                  fontSize: 20,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/svg_icons/search.svg',
                          color: AppColors.blue,
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        VerticalDivider(
                          thickness: 1.w,
                          color: const Color(0xFF7974E7),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: FutureBuilder(
                  future: ref
                      .watch(searchNotifierProvider)
                      .fetchData(searchControlller.text),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapShot.data!.length,
                          itemBuilder: (context, i) => EventCard(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.detail,
                                  arguments: {
                                    "title": snapShot.data![i].title,
                                    "bannerImage":
                                        snapShot.data![i].bannerImage,
                                    "dateTime": snapShot.data![i].dateTime,
                                    "venueName": snapShot.data![i].venueName,
                                    "venueCity": snapShot.data![i].venueCity,
                                    "venueCountry":
                                        snapShot.data![i].venueCountry,
                                    "organiserName":
                                        snapShot.data![i].organiserName,
                                    "organiserIcon":
                                        snapShot.data![i].organiserIcon,
                                    "description":
                                        snapShot.data![i].description,
                                  });
                            },
                            imageUrl: snapShot.data![i].bannerImage,
                            dateTime: Text(
                              dataTimeFormateConverter2(
                                  snapShot.data![i].dateTime),
                              style: const TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            title: Text(
                              // "A virtual evening of smooth jazz"
                              snapShot.data![i].title,
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          separatorBuilder:
                              (BuildContext context, int index) => SizedBox(
                            height: 12.h,
                          ),
                        ),
                      );
                    } else if (snapShot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.black,
                      ));
                    } else if (snapShot.hasError) {
                      return const Center(child: Text("Unable to download"));
                    }
                    return const SizedBox(
                      child: Text("No Event Found"),
                    );
                  }),
            ),
          ],
        ));
  }
}
