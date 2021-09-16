// @dart=2.9

import 'package:flutter/material.dart';
import 'package:weza_social3/screens/login_screen.dart';
import 'package:weza_social3/shared/pref.dart';

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultButton({@required String text, @required Function function}) =>
    Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

// Widget signOutButton(context) => TextButton(
//     onPressed: () {
//       Pref.removeData(key: 'token').then((value) {
//         if (value) {
//           navigateAndFinish(context, LoginScreen());
//         }
//       });
//     },
//     child: Text('sign out'));

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Widget buildTextForm(
        {@required String label,
        @required TextEditingController controller,
        Widget icon,
        Function onSubmitted}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      autofocus: false,
      validator: (String value) {
        if (value.isEmpty)
          return '$label can not be empty';
        else
          return null;
      },
    );

Widget buildProductItems(model, context, {bool isOldPrice = true}) => Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 120,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              child:
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120,
                  height: 120,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.red,
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
              ]),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.3),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '${model.price.toString()}',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          '${model.oldPrice.toString()}',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      CircleAvatar(
                        // backgroundColor: SocialCubit.get(context).favorites[model.id]?  Colors.blue :Colors.grey,
                        child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget buildAppBar({
  @required BuildContext context,
  String title,
  List<Widget> actions,
}) =>
    AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      title: Text(title),
      actions: actions,
    );
