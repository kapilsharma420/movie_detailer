import 'package:flutter/material.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/view/home_sceen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/sign_up_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeSceen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginView(),
        );
          case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUpView(),
        );
           case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('no route deefined ')));
          },
        );
    }
  }
}
