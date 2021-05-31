import 'package:flutter/material.dart';
import 'package:like_us/apptheme/app_theme.dart';
import 'package:like_us/components/login_text_field.dart';
import 'package:like_us/components/primary_button.dart';
import 'package:like_us/components/secondary_button.dart';
import 'package:like_us/routes/routes_path.dart';
import 'package:like_us/store/auth.dart';
import 'package:like_us/utils/get_it_service.dart';
import 'package:like_us/utils/navigation_service.dart';
import 'package:like_us/utils/text_style.dart';
import 'package:like_us/utils/size_config.dart';
import 'package:like_us/utils/validations.dart';

import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String firstName;
  final String lastName;


  const OtpScreen({
    Key key,
    this.email,
    this.password,

    @required this.name,
    @required this.firstName,
    @required this.lastName
  }) : super(key: key);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpCtrl = TextEditingController();

  bool showOtpScreen = false;

  @override
  void initState() {
    super.initState();
  }

  NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 80.toHeight),
                Text(
                  "A WhatsApp Clone.",
                  style: CustomTextStyle.loginTitleStyle.copyWith(fontSize: 36),
                ),
                SizedBox(height: 10.toHeight),
                Text(
                  "Welcome aboard!",
                  style: CustomTextStyle.loginTitleSecondaryStyle,
                ),
                buildOtpForm(),
                SizedBox(height: 24.toHeight),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16.toHeight),
                SecondaryButton(
                  text: "Sign In",
                  onPress: () {
                    _navigationService.popAllAndReplace(RoutePath.Login);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column buildOtpForm() {
    return Column(
      children: [
        SizedBox(height: 45.toHeight),
        CustomLoginTextField(
          hintTextL: "Enter OTP Send to your Email",
          ctrl: otpCtrl,
          validation: Validations.validateOTP,
          maxLength: 6,
          type: TextInputType.number,
        ),
        SizedBox(height: 24.toHeight),
        Consumer<AuthStore>(builder: (_, authStore, __) {
          return PrimaryButton(
            text: "Continue",
            onPress: () async {
              try {
                bool isVerified = await authStore.optVerification(
                  email: widget.email,
                  otp: otpCtrl.text,
                  password: widget.password,
                  name: widget.name,
                );
                if (isVerified)
                  _navigationService.popAllAndReplace(RoutePath.Home);
              } catch (e) {
                print(e);
              }
            },
          );
        }),
      ],
    );
  }
}
