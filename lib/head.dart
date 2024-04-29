import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical/view/fav_page/fav.dart';
import 'package:practical/view_model/services/services_view_model.dart';
import 'package:provider/provider.dart';
import 'package:practical/service/navigation_service.dart';
import 'package:practical/view/auth/signin.dart';
import 'package:practical/view/auth/signup.dart';
import 'package:practical/view_model/auth/auth_view_model.dart';
import 'package:sizer/sizer.dart';
import 'injection.dart';

class Head extends StatefulWidget {
  const Head({Key? key}) : super(key: key);

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (_) => sl<AuthScreenViewModel>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: sl<NavigationService>().navigatorKey,
            initialRoute: '/signin',
            title: 'Rent A Van App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/signin':
                  return MaterialPageRoute(
                    builder: (_) => SigninScreen(),
                  );
                  case '/fav':
                  return MaterialPageRoute(
                    builder: (_) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (_) => sl<AuthScreenViewModel>(),
                        ),
                        ChangeNotifierProvider(
                          create: (_) => sl<ServicesScreenViewModel>(),
                        ),
                      ],
                      child: FavPage(),
                    ),
                  ); 
              }

              return null;
            },
          ),
        );
      },
    );
  }
}
