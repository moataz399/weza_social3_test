// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weza_social3/cubit/register_states.dart';
import 'package:weza_social3/models/user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {@required String email,
      @required String password,
      @required String name,
      @required String phone}) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        name: name,
        phone: phone,
        email: email,
        password: password,
        uId: value.user.uid,
      );
      emit(SocialRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
    @required String uId,

  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uId: uId,
      bio: 'bio..',

    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialUserCreateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialUserCreateErrorState(error));
    });
  }

  Widget suffixIcon = Icon(Icons.remove_red_eye_outlined);
  bool isPasswordShown = false;

  void changeSuffixIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown
        ? Icon(Icons.visibility_off)
        : Icon(Icons.remove_red_eye_outlined);
    emit(ChangeRegisterPasswordMode());
  }
}
