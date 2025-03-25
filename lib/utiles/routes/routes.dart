import 'package:flutter/material.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/view/home_sceen.dart';
import 'package:mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeSceen(),
        );
        case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
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
