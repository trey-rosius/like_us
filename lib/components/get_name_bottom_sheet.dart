import 'package:flutter/material.dart';
import 'package:like_us/apptheme/app_theme.dart';
import 'package:like_us/components/login_text_field.dart';
import 'package:like_us/components/primary_button.dart';
import 'package:like_us/repository/user_repository.dart';
import 'package:like_us/routes/routes_path.dart';
import 'package:like_us/store/user.dart';
import 'package:like_us/utils/get_it_service.dart';
import 'package:like_us/utils/navigation_service.dart';
import 'package:like_us/utils/size_config.dart';
import 'package:like_us/utils/text_style.dart';
import 'package:like_us/utils/validations.dart';


getNameBottomSheet(context) {
  TextEditingController nameCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: bgColor,
      builder: (context) {
        return Container(
          height: 400,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: Border.all(color: Colors.white.withOpacity(0.1), width: 3),
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "What should we call you?",
                    style: CustomTextStyle.loginTitleStyle,
                  ),
                  SizedBox(height: 24.toHeight),
                  CustomLoginTextField(
                    hintTextL: "Full Name",
                    ctrl: nameCtrl,
                    validation: Validations.validateFullName,
                    type: TextInputType.text,
                  ),
                  SizedBox(height: 24.toHeight),
                  PrimaryButton(
                    text: "Continue",
                    onPress: () async {
                      if (!formKey.currentState.validate()) return;
                      await UserRepository().updateFullname(nameCtrl.text);
                      await UserStore().fetchCurrentUser();
                      await UserStore().fetchAllOtherUsers();
                      _navigationService.popAllAndReplace(RoutePath.Home);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
