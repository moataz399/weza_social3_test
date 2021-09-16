
// @dart=2.9


abstract class SocialRegisterStates {}

class SocialRegisterInitialState extends SocialRegisterStates{}


class SocialRegisterLoadingState extends SocialRegisterStates{}
class SocialRegisterSuccessState extends SocialRegisterStates{
}
class SocialRegisterErrorState extends SocialRegisterStates{

  final String error ;

  SocialRegisterErrorState(this.error);
}

class ChangeRegisterPasswordMode extends SocialRegisterStates{}



class SocialUserCreateLoadingState extends SocialRegisterStates{}
class SocialUserCreateSuccessState extends SocialRegisterStates{
}
class SocialUserCreateErrorState extends SocialRegisterStates{

  final String error ;

  SocialUserCreateErrorState(this.error);
}
