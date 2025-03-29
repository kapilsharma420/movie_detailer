import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/utiles/utiles.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signuploading = false;
  bool get signuploading => _signuploading;

  setsignuploading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myrepo.LoginApi(data)
        .then((value) {
          setloading(false);
          final userprefrence = Provider.of<UserViewModel>(
            context,
            listen: false,
          );
          userprefrence.saveuser(user_model(
            token: value['token'].toString()
          ));
          Utiles.FlushBarErrorMessages('login successfully', context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setloading(false);
          Utiles.FlushBarErrorMessages(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setsignuploading(true);
    _myrepo
        .signupApi(data)
        .then((value) {
          setsignuploading(false);
          Utiles.FlushBarErrorMessages('Register Successfully', context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setsignuploading(false);
          Utiles.FlushBarErrorMessages(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
