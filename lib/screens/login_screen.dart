// @dart=2.9

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weza_social3/cubit/login-cubit.dart';
import 'package:weza_social3/cubit/login_states.dart';
import 'package:weza_social3/layout/home_layout.dart';
import 'package:weza_social3/screens/register_screen.dart';
import 'package:weza_social3/shared/components.dart';
import 'package:weza_social3/shared/pref.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (BuildContext context, state) {
          if (state is SocialLoginSuccessState) {
            //Pref.saveData(key: 'uId', value: state.uId).then((value) {
           //   navigateTo(context, HomeLayout());
          //  }
         //   );
            navigateTo(context, HomeLayout());
          }
          if (state is SocialLoginErrorState) {
            Fluttertoast.showToast(msg: state.error);
            print(state.error);
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.black)),
                        Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Text(
                            'Login Now To Communicate With Friends',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          autofocus: false,
                          validator: (value) =>
                              value.isEmpty ? 'please enter your email' : null,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText:
                              SocialLoginCubit.get(context).isPasswordShown,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: SocialLoginCubit.get(context).suffixIcon,
                              onPressed: () {
                                SocialLoginCubit.get(context)
                                    .changeSuffixIcon();
                              },
                            ),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          autofocus: false,
                          validator: (value) =>
                              value.isEmpty ? 'Password is too short ' : null,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defaultButton(
                              text: 'LOGIN',
                              function: () {
                                if (_formKey.currentState.validate()) {
                                  SocialLoginCubit.get(context).userLogin(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                                }
                              }),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\' have an account ?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            FlatButton(
                                onPressed: () {
                                  navigateAndFinish(context, RegisterScreen());
                                },
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        )
                      ],
                    ),
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
