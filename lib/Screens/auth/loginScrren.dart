// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_basic1/Screens/HomeScreen.dart';
import 'package:flutter_application_basic1/cubit/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widgets/defultTextFormFiled.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isloading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is loginLoading) {
            isloading = true;
          }
          if (state is loginSucces) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
            isloading = false;
          }
          if (state is loginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMassege!,
                    style: const TextStyle(color: Colors.white))));
            isloading = true;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isloading,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 100.0,
                      ),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 300.0,
                        width: 300.0,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'images/hussein.jpg',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defultTextFormFiled(
                        maxline: 1,
                        typeofKeyword: TextInputType.emailAddress,
                        title: 'Enter Your Email',
                        IconinText: Icon(Icons.email),
                        textwillshow: 'Please Enter your Email ',
                        nameContoller: emailcontroller,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defultTextFormFiled(
                        maxline: 1,
                        typeofKeyword: TextInputType.visiblePassword,
                        title: 'Enter Your Password',
                        IconinText: Icon(Icons.lock),
                        textwillshow: 'Please Enter your Password ',
                        nameContoller: passwordcontroller,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Center(
                        child: MaterialButton(
                          onPressed: (() {}),
                          child: Text(
                            'Forget PassWord?',
                            style: TextStyle(
                                color: HexColor('#42A2C1'), fontSize: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 25.0,
                          right: 25.0,
                        ),
                        width: 300.0,
                        decoration: BoxDecoration(color: HexColor("#42A2C1")),
                        child: Builder(
                          builder: (context) => Center(
                            child: MaterialButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await BlocProvider.of<LoginCubit>(context)
                                      .loginUser(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                }
                              },
                              child: Text(
                                'Get started',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
