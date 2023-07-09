// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_application_basic1/Screens/auth/loginScrren.dart';
import 'package:flutter_application_basic1/Screens/HomeScreen.dart';
import 'package:flutter_application_basic1/cubit/register/register_cubit.dart';
import 'package:flutter_application_basic1/widgets/defultTextFormFiled.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../reuableComponent.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              isloading = true;
            } else if (state is RegisterSuccess) {
              isloading = false;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Welcome in the notes app',
                      style: TextStyle(color: Colors.white))));
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMassege!,
                      style: TextStyle(color: Colors.white))));
              isloading = false;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isloading,
              child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.0,
                          ),
                          Text(
                            'Welcome Onboard! ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Let’s help you meet up your tasks',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 70.0,
                          ),
                          defultTextFormFiled(
                            maxline: 1,
                            typeofKeyword: TextInputType.name,
                            title: ' Enter Your Full Name',
                            IconinText: Icon(Icons.info),
                            textwillshow: 'Please Enter Your Full Name:',
                            nameContoller: namecontroller,
                            //textofFiled: fullName
                          ),
                          defultSizeBox(),
                          defultTextFormFiled(
                            maxline: 1,
                            typeofKeyword: TextInputType.emailAddress,
                            title: ' Enter Your Email',
                            IconinText: Icon(Icons.email),
                            textwillshow: 'Please Enter Your Email:',
                            nameContoller: emailcontroller,
                            //textofFiled: email
                          ),
                          defultSizeBox(),
                          defultTextFormFiled(
                            maxline: 1,
                            typeofKeyword: TextInputType.visiblePassword,
                            title: ' Enter Your  Password',
                            IconinText: Icon(Icons.lock),
                            textwillshow: 'Please Enter Your Password:',
                            nameContoller: passwordcontroller,
                            //textofFiled: paaword
                          ),
                          defultSizeBox(),
                          defultTextFormFiled(
                            maxline: 1,
                            typeofKeyword: TextInputType.visiblePassword,
                            title: 'Enter Phone',
                            IconinText: Icon(Icons.phone),
                            textwillshow: 'Please Enter Your Phone:',
                            nameContoller: phonecontroller,
                            // textofFiled: confirmPaaword
                          ),
                          defultSizeBox(),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 25.0,
                              right: 25.0,
                            ),
                            width: 300.0,
                            decoration:
                                BoxDecoration(color: HexColor("#42A2C1")),
                            child: Builder(
                              builder: (context) => Center(
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      await BlocProvider.of<RegisterCubit>(
                                              context)
                                          .signUpUser(
                                              email: emailcontroller.text,
                                              password: passwordcontroller.text,
                                              name: namecontroller.text,
                                              phone: passwordcontroller.text);
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
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ignore: avoid_unnecessary_containers
                              Text(
                                'Already have an account ? ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),

                              Builder(builder: (context) {
                                return TextButton(
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (((context) =>
                                                LoginScreen()))))
                                  },
                                  child: Text(
                                    'Sign in ',
                                    style: TextStyle(
                                        color: HexColor('#42A2C1'),
                                        fontSize: 10.0),
                                  ),
                                );
                              }),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
