import 'package:flutter/material.dart';

import 'package:like_us/apptheme/app_theme.dart';
import 'package:like_us/components/primary_button.dart';
import 'package:like_us/components/secondary_button.dart';
import 'package:like_us/routes/routes_path.dart';
import 'package:like_us/utils/get_it_service.dart';
import 'package:like_us/utils/navigation_service.dart';
import 'package:like_us/utils/size_config.dart';
import 'package:like_us/utils/text_style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.only(
          top: 80.toHeight,
          bottom: 40.toHeight,
          left: 30.toWidth,
          right: 30.toWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: 300.toWidth,
                  height: 300.toHeight,
                  child: Image.asset(
                    "assets/images/splash.png",
                    width: 500.toWidth,
                    height: 500.toHeight,
                  ),
                ),
                SizedBox(height: 20.toHeight),
                Text(
                  "A Whatsapp Clone.",
                  style: CustomTextStyle.loginTitleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.toHeight),
              ],
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Sign In",
                  onPress: () {
                    _navigationService.popAllAndReplace(RoutePath.Login);
                  },
                ),
                SizedBox(height: 12.toHeight),
                SecondaryButton(
                  text: "Register",
                  onPress: () {
                    _navigationService.popAllAndReplace(RoutePath.Register);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
