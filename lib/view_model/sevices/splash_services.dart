import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashServices {
  void checkauthentication(BuildContext context) async {
    getuserdata()
        .then((value) async {
          print(value.token);
             if (value.token != null && value.token!.isNotEmpty) {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    })
        .onError((error, stackTrace) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  Future<user_model> getuserdata() => UserViewModel().getuser();
}

// import 'package:flutter/widgets.dart';
// import 'package:mvvm/utiles/routes/routes_name.dart';
// import 'package:mvvm/view_model/user_view_model.dart';

// class SplashServices {
//   void checkauthentication(BuildContext context) async {
//     UserViewModel().getuser().then((value) async {
//       await Future.delayed(Duration(seconds: 3)); // Show splash for 3 seconds

//       if (value.token != null && value.token!.isNotEmpty) {
//         Navigator.pushReplacementNamed(context, RoutesName.home);
//       } else {
//         Navigator.pushReplacementNamed(context, RoutesName.login);
//       }
//     }).onError((error, stackTrace) {
//       print("Error fetching user: $error");
//     });
//   }
// }
