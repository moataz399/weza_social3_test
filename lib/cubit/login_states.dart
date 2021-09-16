
// @dart=2.9

abstract class SocialLoginStates {}

 class SocialLoginInitialState extends SocialLoginStates{}
 class SocialLoginLoadingState extends SocialLoginStates{}
 class SocialLoginSuccessState extends SocialLoginStates{
final uId;

SocialLoginSuccessState(this.uId);
}
 class SocialLoginErrorState extends SocialLoginStates{

 final String error ;

 SocialLoginErrorState(this.error);
}

 class ChangeLoginPasswordMode extends SocialLoginStates{}
