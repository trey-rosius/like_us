import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:like_us/routes/routes_path.dart';
import 'package:like_us/store/user.dart';
import 'package:like_us/utils/get_it_service.dart';
import 'package:like_us/utils/navigation_service.dart';
import 'package:like_us/utils/size_config.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleNavigation();
    });
  }

  handleNavigation() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
    if (authSessions.isSignedIn) {
      await UserStore().fetchCurrentUser();
      await UserStore().fetchAllOtherUsers();
      _navigationService.popAllAndReplace(RoutePath.Home);
    } else
      _navigationService.popAllAndReplace(RoutePath.Splash);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container();
  }
}
