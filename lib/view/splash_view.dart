import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/view_model/sevices/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkauthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:
    
    Image(image: AssetImage('images/original.webp')),
     //Text('splashscreen',style: Theme.of(context).textTheme.headlineLarge,),
     
     ));
  }
}
