
// @dart=2.9

abstract class SocialStates {}

class SocialInitialState extends SocialStates{}
class SocialGetUserLoadingState extends SocialStates{}

class SocialGEtUserSuccessState extends SocialStates{
 // final uId;

 // SocialGEtUserSuccessState(this.uId);
}
class SocialGEtUserErrorState extends SocialStates{

  final String error ;

  SocialGEtUserErrorState(this.error);
}
class ChangeBottomNav extends SocialStates{}
class AddPostState extends SocialStates{}


class GetProfileImageSuccess extends SocialStates{}
class GetProfileImageError extends SocialStates{}



class GetCoverImageSuccess extends SocialStates{}
class GetCoverImageError extends SocialStates{}


class GetPostImageSuccess extends SocialStates{}
class GetPostImageError extends SocialStates{}


class UploadCoverImageSuccess extends SocialStates{}
class UploadCoverImageError extends SocialStates{}




class UploadProfileImageSuccess extends SocialStates{}
class UploadProfileImageError extends SocialStates{}
class UserUpdateErrorState extends SocialStates{}

class UserUpdateLoadingState extends SocialStates{}






class SocialCreatePostLoadingState extends SocialStates{}

class SocialcreatePostSuccessState extends SocialStates{

}
class SocialcreatePostErrorState extends SocialStates{

  final String error ;

  SocialcreatePostErrorState(this.error);
}
class RemoveImage extends SocialStates{}




class SocialGetPostsLoadingState extends SocialStates{}
class SocialGEtPostsSuccessState extends SocialStates{

}
class SocialGEtPostsErrorState extends SocialStates{

  final String error ;

  SocialGEtPostsErrorState(this.error);
}

class SocialGetUsersLoadingState extends SocialStates{}
class SocialGEtUsersSuccessState extends SocialStates{

}
class SocialGEtUsersErrorState extends SocialStates{

  final String error ;

  SocialGEtUsersErrorState(this.error);
}



class SocialGetcommentLoadingState extends SocialStates{}
class SocialGEtcommentSuccessState extends SocialStates{

}
class SocialGEtcommentErrorState extends SocialStates{

  final String error ;

  SocialGEtcommentErrorState(this.error);
}


class SocialGetCOMMENTSLoadingState extends SocialStates{}
class SocialGEtCOMMENTSSuccessState extends SocialStates{

}
class SocialGEtCOMMENTSErrorState extends SocialStates{

  final String error ;

  SocialGEtCOMMENTSErrorState(this.error);
}







class SocialLikedPostSuccessState extends SocialStates{

}
class SocialLikedPostErrorState extends SocialStates{

  final String error ;

  SocialLikedPostErrorState(this.error);
}



class SocialCommentPostSuccessState extends SocialStates{

}
class SocialCommentPostErrorState extends SocialStates{

  final String error ;

  SocialCommentPostErrorState(this.error);
}




class SocialGEtMessageSuccessState extends SocialStates{

}
class SocialGEtMessageErrorState extends SocialStates{

  final String error ;

  SocialGEtMessageErrorState(this.error);
}


class SocialSendMessageSuccessState extends SocialStates{

}
class SocialSendMessageErrorState extends SocialStates{

  final String error ;

  SocialSendMessageErrorState(this.error);
}