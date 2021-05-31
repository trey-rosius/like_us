import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:like_us/apptheme/app_theme.dart';
import 'package:like_us/screens/StatusScreens/status_page.dart';
import 'package:like_us/store/user.dart';
import 'package:line_icons/line_icons.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<UserStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page"),),
      backgroundColor: bgColor,
      body: StatusPage(),

    );
  }


}
