import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utiles/utiles.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myrepo.LoginApi(data)
        .then((value) {
          Utiles.FlushBarErrorMessages('login successfully', context);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((Error, StackTrace) {
          if (kDebugMode) {
            Utiles.FlushBarErrorMessages('Incorrect', context);
            print(Error.toString());
          }
        });
  }
}
