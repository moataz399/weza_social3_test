// @dart=2.9

class SocialUserModel {
  String name;

  String email;

  String phone;

  String password;

  String uId;

  String image;
  String bio;
  String cover;

  SocialUserModel({this.name, this.email, this.phone, this.password, this.uId,
       this.image, this.bio,this.cover} );

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    uId = json['uId'];
    cover = json['cover'];
    image = json['image'];
    bio = json['bio'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'uId': uId,
      'image': image,
      'bio': bio,
      'cover':cover,
    };
  }
}
