// @dart=2.9


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weza_social3/cubit/social_states.dart';
import 'package:weza_social3/screens/add_post.dart';
import 'package:weza_social3/screens/chat_screen.dart';
import 'package:weza_social3/screens/feeds_screen.dart';
import 'package:weza_social3/screens/profile-screen.dart';


class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    FeedsScreen(),
    ChatScreen(),
    AddPostScreen(),
    ProfileScreen(),
  ];
  List<String> titles = [
    'News Feed',
    'Chat',
    'Add Post',
    'Profile',
  ];

  int currentIndex = 0;
  void changeBottomNav(int index) {
    if (index == 2) {
      emit(AddPostState());
    } else {
      currentIndex = index;
      emit(ChangeBottomNav());
    }
  }

  }



