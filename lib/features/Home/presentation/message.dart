import 'package:flutter/material.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Home/presentation/custom_card.dart';

import 'chat_circle_list_view.dart';
import 'create_home_screen.dart';

class Messages extends StatefulWidget {
  // const Messages({Key key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    var selectedIndex;
    return Scaffold(
        backgroundColor: Color(0xFFffffff),
        bottomNavigationBar: CreateHomeScreen(
          selectedIndex: 3,
            Color2: selectedIndex == 3
                ? Colors.grey[300]
                : MaaruColors.textButtonColor
            //Color:MaaruColors.textButtonColor
        ),
        body: SafeArea(
        bottom: false,
            child: SingleChildScrollView(child:
            Column(

          children: [

SizedBox(height: 30,),


            // Align(
            //     alignment: Alignment.centerRight,
            //
            //         child:
                    Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/128/CrystalGaskell.png',
                    height: 60,
                   // width: 60,
                  ),
               // )
        ),

            Padding(padding: EdgeInsets.only(top: 15,right: 20,left: 10),
                child:
                TextFormField(

                  // cursorColor: Colors.black,
                  decoration: InputDecoration(

                      enabledBorder: new OutlineInputBorder(
                          borderRadius:
                          new BorderRadius.circular(10.7),
                          borderSide: new BorderSide(color: Colors.grey[300],width: 1.0)),
                      focusedBorder: new OutlineInputBorder(
                          borderRadius:
                          new BorderRadius.circular(10.7),
                          borderSide: new BorderSide(color: Colors.grey[300],width: 1.0)),

                      hintText: 'Search',hintStyle: MaaruStyle.text.greyDisable,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 25.0, 10.0),
                      fillColor: Colors.white,
                      suffixIcon: Image.asset(
                        'assets/icons/icone-setting-19.png',
                        height: 50,
                        // width: 30,
                      )),
                )),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '   Providers'.toUpperCase(),
                style: MaaruStyle.text.tiny,
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading:
                  Container(height: 100,width:200,child:
              Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
              ProfileAvatar(
                imageUrl: 'assets/images/istockphoto-1179420343-612x612.jpg',
                avatarRadius: 60,
                width: 90,
                Color: Colors.yellow,
              ),
                ProfileAvatar(
                  imageUrl: 'assets/images/istockphoto-1179420343-612x612.jpg',
                  avatarRadius: 60,
                  width: 90,
                  Color: Colors.yellow,
                ),]),
// title: Padding(padding: EdgeInsets.only(right: 30),child:
// Align(alignment: Alignment.centerLeft,child:
// ProfileAvatar(
//   imageUrl: 'assets/images/Russo-Alessandro-Eric-20.jpg',
//   avatarRadius: 60,
//   width: 90,
//   Color: Colors.yellow,
// ),
                  )),

SizedBox(height: 20,),
            CustomCard()
          ],
        ))));
  }
}
