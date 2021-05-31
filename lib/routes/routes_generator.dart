import 'package:flutter/material.dart';
import 'package:like_us/routes/routes_path.dart';
import 'package:like_us/screens/LoginScreen/login_screen.dart';
import 'package:like_us/screens/OtpScreen/otp_screen.dart';
import 'package:like_us/screens/RegisterScreen/register_screen.dart';
import 'package:like_us/screens/SplashScreen/splash_screen.dart';
import 'package:like_us/screens/home_screen.dart';
import 'package:like_us/wrapper.dart';




Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.Wrapper:
      return MaterialPageRoute(builder: (_) => Wrapper());

    case RoutePath.Login:
      return MaterialPageRoute(builder: (_) => LoginScreen());

    case RoutePath.Register:
      return MaterialPageRoute(builder: (_) => RegisterScreen());

    case RoutePath.Splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case RoutePath.Otp:
      Map<String, String> arguments = settings.arguments;
      return MaterialPageRoute(
        builder: (_) => OtpScreen(
          email: arguments['email'],
          password: arguments['password'],
          name: arguments['name'],
        ),
      );

    case RoutePath.Home:
      return MaterialPageRoute(builder: (_) => HomeScreen());

    default:
      return MaterialPageRoute(builder: (_) => Wrapper());
  }
}
