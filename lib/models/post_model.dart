// @dart=2.9

class PostModel {
  String name;

  String dateTime;

  String text;

  String uId;
  String postImage;

  String image;

  PostModel({this.name, this.dateTime, this.text, this.uId, this.postImage,
      this.image});

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'text': text,
      'postImage': postImage,
    };
  }
}
