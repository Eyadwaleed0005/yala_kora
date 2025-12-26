import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/dio_helper/dio_helper.dart';
import 'package:yalakora/core/local/shared_preferences.dart';
import 'package:yalakora/core/routes/app_routes.dart';
import 'package:yalakora/core/routes/route_names.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(257, 557),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Yala Kora',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Tajawal',
          ),
          initialRoute: RouteNames.homeScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
