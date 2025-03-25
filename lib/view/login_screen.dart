import 'package:flutter/material.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/view/home_sceen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeSceen()),
            // );

            Navigator.pushNamed(context, RoutesName.home);
          },
          child: Text('click'),
        ),
      ),
    );
  }
}
