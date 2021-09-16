// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({@required String email, @required String password}) {


    emit(SocialLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      emit(SocialLoginSuccessState(value.user.uid));
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
    });
  }

  Widget suffixIcon = Icon(Icons.remove_red_eye_outlined);
  bool isPasswordShown = false;

  void changeSuffixIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown
        ? Icon(Icons.visibility_off)
        : Icon(Icons.remove_red_eye_outlined);
    emit(ChangeLoginPasswordMode());
  }
}
