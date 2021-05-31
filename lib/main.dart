

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_us/routes/routes_generator.dart';
import 'package:like_us/routes/routes_path.dart';
import 'package:like_us/store/auth.dart';
import 'package:like_us/store/user.dart';
import 'package:like_us/utils/amplify_services.dart';
import 'package:like_us/utils/get_it_service.dart';
import 'package:like_us/utils/navigation_service.dart';
import 'package:like_us/wrapper.dart';
import 'package:provider/provider.dart';

import 'models/ModelProvider.dart';
import 'models/Post.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AmplifyService.configureAmplify();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<UserStore>(
          create: (_) => UserStore(),
          lazy: false,
        ),
        ChangeNotifierProvider<AuthStore>(
          create: (_) => AuthStore(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        navigatorKey: get_it_instance_const<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: RoutePath.Wrapper,
      ),
    );
  }
}

