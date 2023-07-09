import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> signUpUser({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      emit(RegisterLoading());
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(value.user!.uid)
            .set({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'uid': value.user!.uid,
        });
        emit(RegisterSuccess());
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('uid', value.user!.uid);
        pref.setString('email', value.user!.email!);
      }).catchError((error) {
        emit(RegisterFailure(errorMassege: 'error name '));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMassege: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMassege: 'email-already-in-use '));
      }
    } catch (e) {
      emit(RegisterFailure(
          errorMassege: 'Somthing went wrong \nPlease try again'));
    }
  }
}
