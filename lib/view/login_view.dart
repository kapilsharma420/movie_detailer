import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/resources/component/round_button.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/utiles/utiles.dart';
import 'package:mvvm/view/home_sceen.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode email_focus_node = FocusNode();
  FocusNode password_focus_node = FocusNode();
  ValueNotifier<bool> obsecurepassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    email_focus_node.dispose();
    password_focus_node.dispose();
    obsecurepassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: email_focus_node,
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                Utiles.fieldfocuschange(
                  context,
                  email_focus_node,
                  password_focus_node,
                );
              },
            ),

            ValueListenableBuilder(
              valueListenable: obsecurepassword,
              builder: (context, value, child) {
                return TextFormField(
                  focusNode: password_focus_node,
                  obscuringCharacter: '*',
                  obscureText: value,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        obsecurepassword.value = !obsecurepassword.value;
                      },
                      child:
                          obsecurepassword.value
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height * .05),
            RoundButton(
              title: 'login',
              loading: authViewModel.loading,
              onpress: () {
                //for debugin print
                // print('again click');

                if (emailcontroller.text.isEmpty &&
                    passwordcontroller.text.isEmpty) {
                  Utiles.FlushBarErrorMessages(
                    'email and password both empty',
                    context,
                  );
                } else if (emailcontroller.text.isEmpty) {
                  Utiles.FlushBarErrorMessages(
                    'please enter the email',
                    context,
                  );
                } else if (passwordcontroller.text.isEmpty) {
                  Utiles.FlushBarErrorMessages(
                    'please enter the password',
                    context,
                  );
                } else if (passwordcontroller.text.length < 8) {
                  Utiles.FlushBarErrorMessages(
                    'lenght of password is less than 8',
                    context,
                  );
                } else {
                  Map data = {
                    'email': emailcontroller.text.toString(),
                    'password': passwordcontroller.text.toString(),
                  };
                  authViewModel.loginApi(data, context);
                  print('api hit ');
                  //Utiles.toastMessage('api hit ');
                }
              },
            ),
            SizedBox(height: height * .05),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signup);
              },
              child: Text('Dont have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
