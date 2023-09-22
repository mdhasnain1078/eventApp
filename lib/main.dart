import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/routes/routes.dart';
import 'common/theme/light_theme.dart';
import 'features/event/page/event_page.dart';

void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "WhatsApp me",
        theme: lightTheme(),
        home:
        const EventPage(),
        onGenerateRoute: Routes.onGeneratedRoute,
      ),
      designSize: const Size(375, 812),
    );
  }
}