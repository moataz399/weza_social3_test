// @dart=2.9

import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              Image(
                image: NetworkImage(
                    'https://image.freepik.com/free-photo/emotional-bearded-male-has-surprised-facial-expression-astonished-look-dressed-white-shirt-with-red-braces-points-with-index-finger-upper-right-corner_273609-16001.jpg'),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Communicate with Friends',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ]),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              height: 1,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => buildPostItem(context, index),
            itemCount: 10,
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget buildPostItem(context, index) => Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              trailing: IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: () {},
              ),
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://scontent.fcai21-2.fna.fbcdn.net/v/t1.6435-9/136197106_1362195047506115_5198803072781895561_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_eui2=AeEyoD_Rw9pOXCNmsgq6Lk_4XyieNWI7mR9fKJ41YjuZHy1oVroq-q6jpsNoMGqsVxk8eOdwJVJZw1MQova-r-6c&_nc_ohc=bVUqPUUoLloAX8Hd2vD&_nc_ht=scontent.fcai21-2.fna&oh=9d773522009dddb8d30c73dc95e88926&oe=616432C5'),
              ),
              title: Row(
                children: [
                  Text(
                    'Moataz mohamed',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 16.0,
                  )
                ],
              ),
              subtitle: Text(
                '12 may 2021',
                style: Theme.of(context).textTheme.caption.copyWith(height: 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.grey,
                height: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'ahmed sdsa;dkflsdkf fdkflskdf kfdlsakfsdkfli dlfksadfkldkf dfksodfj dofsdofk fdsf odf dosfosdk dfdsdsfdsaffffff dfspfks. fdof dsfj jdfkj djfsdjfsdkf,sjdafkdsl jisdf jdfsjdk dsfs',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      height: 1.3, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Wrap(children: [
                Container(
                  padding: EdgeInsetsDirectional.only(end: 6),
                  height: 25,
                  child: MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Text(
                      '#Flutter',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.blue),
                    ),
                    minWidth: 1.0,
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(end: 6),
                  height: 25,
                  child: MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Text(
                      '#Development',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.blue),
                    ),
                    minWidth: 1.0,
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(end: 6),
                  height: 25,
                  child: MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Text(
                      '#software',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.blue),
                    ),
                    minWidth: 1.0,
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(end: 6),
                  height: 25,
                  child: MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Text(
                      '#technology',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.blue),
                    ),
                    minWidth: 1.0,
                  ),
                ),
              ]),
            ),
            Container(
                margin: EdgeInsets.all(10),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.freepik.com/free-photo/emotional-bearded-male-has-surprised-facial-expression-astonished-look-dressed-white-shirt-with-red-braces-points-with-index-finger-upper-right-corner_273609-16001.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('1220',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(height: 1)),
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.mode_comment_rounded,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('100 comments',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(height: 1)),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Divider(
                color: Colors.grey,
                height: 1.0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                                'https://scontent.fcai21-2.fna.fbcdn.net/v/t1.6435-9/90028102_1126340257758263_1240922133211643904_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEtG4S6G2VNcfcbPHvUoDc6sW3CpGKqhPyxbcKkYqqE_Fa6K44Pj6kcuMSWUqVd_5YMgnUm76XbFxc16Bdk-6F7&_nc_ohc=FqJD42QeEaYAX-3-KYZ&_nc_ht=scontent.fcai21-2.fna&oh=04bcc2faaf6f5b08c131ea5fb57937b0&oe=61629C91'),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: TextFormField(
                            onFieldSubmitted: (value) {},
                            controller: TextEditingController(),
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'write your comment..',
                                contentPadding: EdgeInsets.zero,
                                labelStyle:
                                    Theme.of(context).textTheme.caption),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      onPressed: () {},
                    ),
                    Text(
                      'Like',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 12, height: .4),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ]),
                ),
              ],
            )
          ],
        ),
      );
}
