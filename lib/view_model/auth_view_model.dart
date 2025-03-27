import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/utiles/utiles.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myrepo.LoginApi(data)
        .then((value) {
          setloading(false);
          Utiles.FlushBarErrorMessages('login successfully', context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setloading(false);
          Utiles.FlushBarErrorMessages('incorrect or no internet ', context);
          if (kDebugMode) {
            
            print(error.toString());
          }
        });
  }
}
