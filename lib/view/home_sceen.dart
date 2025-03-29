import 'package:flutter/material.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        
        automaticallyImplyLeading: false,
        actions: [
 InkWell(
          onTap: () {
            userPrefrence.remove().then((value) {
        Navigator.pushNamed(
          context,
          RoutesName.login,
         
        );
            });
          },
          child: Center(child: Text('logout',style: TextStyle(color: Colors.white),)),
        ),
        SizedBox(width: 20,)
        ],
      ),
      
      
      body: SafeArea(
        
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
           
          ],
        ),
      ),
    );
  }
}
