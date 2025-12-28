import 'package:flutter/material.dart';
import 'package:yalakora/ui/auth_screens/login_screen/ui/login_screen.dart';
import 'package:yalakora/ui/auth_screens/sign_up_screen/ui/sign_up_screen.dart';
import 'package:yalakora/ui/home_screen/ui/home_screen.dart';
import 'package:yalakora/ui/splash_screen/ui/splash_screen.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/stadium_details_screen.dart';
import 'package:yalakora/ui/stadiums_screen/ui/stadiums_screen.dart';
import 'package:yalakora/ui/start_screen/ui/start_screen.dart';
import 'route_names.dart';


class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.startScreen:
        return MaterialPageRoute(builder: (_) => StartScreen());

      case RouteNames.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case RouteNames.stadiumsScreen:
        return MaterialPageRoute(builder: (_) => StadiumsScreen());

      case RouteNames.stadiumDetailsScreen:
        final stadiumId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => StadiumDetailsScreen(stadiumId: stadiumId),
        );
    }
    return null;
  }
}

