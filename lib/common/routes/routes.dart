import 'package:eventapp/common/models/event_model.dart';
import 'package:eventapp/features/event/page/event_detail_page.dart';
import 'package:flutter/material.dart';

import '../../features/event/page/event_page.dart';
import '../../features/search/page/search_page.dart';

class Routes {
  static const String event = "event";
  static const String search = "search";
  static const String detail = "detail";

  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case event:
        return MaterialPageRoute(builder: (context) => const EventPage());
      case search:
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case detail:
        final Map arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => EventDetailPage(
                  title: arg['title'],
                  bannerImage: arg['bannerImage'],
                  dateTime: arg['dateTime'],
                  venueName: arg['venueName'],
                  venueCity: arg['venueCity'],
                  venueCountry: arg['venueCountry'],
                  organiserName: arg['organiserName'],
                  organiserIcon: arg['organiserIcon'],
                  description: arg['description'],
                ));

      // case verification:
      //   final Map arg = settings.arguments as Map;
      //   return MaterialPageRoute(builder: (context)=> VarificationPage(smsCodeId: arg["smsCodeId"], phoneNumber: arg["phoneNumber"],));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("No route foound for the page"),
                  ),
                ));
    }
  }
}
