// @dart=2.9

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weza_social3/cubit/register_cubit.dart';
import 'package:weza_social3/cubit/register_states.dart';
import 'package:weza_social3/layout/home_layout.dart';
import 'package:weza_social3/shared/components.dart';


class RegisterScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
          listener: (BuildContext context, state) {
            if(state is    SocialUserCreateSuccessState){
              navigateTo(context,HomeLayout());
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
                          Text('Register',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.black)),
                          Padding(
                            padding: EdgeInsets.only(top: 7),
                            child: Text(
                              'register now to browse our hot offers',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          buildTextForm(controller: nameController,label: 'Name',icon: Icon(Icons.person)),
                          SizedBox(
                            height: 15,
                          ),
                          buildTextForm(controller: emailController,label: "Email Address",icon: Icon(Icons.email)),
                          SizedBox(
                            height: 30,
                          ),
                          buildTextForm(controller: passwordController,label: 'Password',icon: Icon(Icons.remove_red_eye_outlined)),
                          SizedBox(
                            height: 15,
                          ),
                          buildTextForm(controller: phoneController,label: 'Phone',icon: Icon(Icons.phone)),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition:state is! SocialRegisterLoadingState
                             ,
                            builder: (context) => defaultButton(
                                text: 'Register',
                                function: () {
                                  if (_formKey.currentState.validate()) {
                                    SocialRegisterCubit.get(context).userRegister(
                                      name: nameController.text.trim(),
                                        phone: phoneController.text.trim(),
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim());
                                  }
                                }),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
