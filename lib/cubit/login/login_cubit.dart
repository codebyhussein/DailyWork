import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      emit(loginLoading());

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //print(email);

      pref.setString('email', credential.user!.email!);

      emit(loginSucces());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(loginFailure(errorMassege: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(loginFailure(errorMassege: 'Wrong password'));
      } else {
        emit(loginFailure(errorMassege: 'Something went wrong'));
      }
    } catch (e) {
      emit(loginFailure(errorMassege: 'Something went wrong'));
    }
  }
}
