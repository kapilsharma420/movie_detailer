import 'package:flutter/material.dart';
import 'package:mvvm/resources/component/round_button.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/utiles/utiles.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
        title: Text('Signup', style: TextStyle(color: Colors.white)),
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
              title: 'SignUp',

              loading: authViewModel.signuploading,
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
                } else if (passwordcontroller.text.length < 6) {
                  Utiles.FlushBarErrorMessages(
                    'lenght of password is less than 6',
                    context,
                  );
                } else {
                  Map data = {
                    'email': emailcontroller.text.toString(),
                    'password': passwordcontroller.text.toString(),
                  };
                  authViewModel.signupApi(data, context);
                  print('api hit ');
                  //Utiles.toastMessage('api hit ');
                }
              },
            ),
            SizedBox(height: height * .05),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, RoutesName.login);
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
