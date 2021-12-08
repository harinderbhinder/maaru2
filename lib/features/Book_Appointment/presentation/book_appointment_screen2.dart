import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';

import 'book_appointment_screen1.dart';
import 'booked_confirm.dart';

class BookAppointment2 extends StatefulWidget {
  @override
  _BookAppointment2State createState() => _BookAppointment2State();
}

class _BookAppointment2State extends State<BookAppointment2> {
  bool star1 = true;
  bool star2 = true;
  bool star3 = true;
  bool star4 = true;
  bool star5 = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.grey,
        bottomNavigationBar: CreateHomeScreen(
          // Color:MaaruColors.textButtonColor
        ),
        body:SafeArea(bottom: false,
        child:
        ListView(
          children: [
            Flex(direction: Axis.vertical, children: [

              Container(
                color: Colors.red,

                child: Image.asset(
                  'assets/images/imgdd.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              Container(
               // height: size.height * 1.1,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),

                  child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      color: Color(0xffFFFFFF),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => BookAppointment1()));
                                  },
                                  child:
                                Image.asset(
                                  'assets/icons/Rectangle copy 3.png',
                                  height: 40,
                                  width: 40,
                                )),
                               const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) => BookAppointment2()));
                                    },
                                    child: Image.asset(
                                      'assets/icons/Rectangle copy 3.png',
                                      height: 40,
                                      width: 40,

                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) => BookAppointmentScreen3()));
                                    },
                                    child:
                                    Image.asset(
                                      'assets/icons/icone-setting-68.png',
                                      height: 40,
                                      width: 40,
                                      color: Colors.grey[100],
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Austin Pet Groomer',
                                  style: MaaruStyle.text.tiniest
                                ),
// SizedBox(width: size.width*0.34,),
                                Image.asset('assets/icons/New Project (2).png',
                                    width: size.width * 0.08)
                              ],
                            ),
                            Text(
                              '1115 Emihi Grove Austin, Textas 00000',
                              style:
                                MaaruStyle.text
                              .tiny,),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Indicator(
                              text: ' 5 ',
                              text2: '(154)  ',
                              assetImage: 'assets/images/New Project (32).png',
                            ),
                            Indicator(
                              text: ' 4 ',
                              text2: '(21)    ',
                              assetImage: 'assets/images/New Project (33).png',
                            ),
                            Indicator(
                              text: ' 3 ',
                              text2: '(4)      ',
                              assetImage: 'assets/images/New Project (34).png',
                            ),
                            Indicator(
                              text: ' 2 ',
                              text2: '(0)      ',
                              assetImage: 'assets/images/New Project (35).png',
                            ),
                            Indicator(
                              text: ' 1 ',
                              text2: '(0)      ',
                              assetImage: 'assets/images/New Project (35).png',
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.black,
                                  backgroundImage: NetworkImage(
                                      'https://images.squarespace-cdn.com/content/v1/5ef8f04e964fab1126c5cf8b/1603736695413-4UCKNWV23VVSE63BQ9NR/Less+Professional+Profile.JPG'),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  'Jimmy Hanks',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: size.width * 0.40,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 55),
                              child: Text(
                                'Lorem ipsum dolor sit amet,consectur adipiscing elit,sed do ejusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: MaaruStyle.text.tiny
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.black,
                                  backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&usqp=CAU'),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  'Elen Brock',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: size.width * 0.40,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 55),
                                child: Text(
                                  'Lorem ipsum dolor sit amet,consectur adipiscing elit,sed do ejusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: MaaruStyle.text.tiny
                                )),
                            SizedBox(height: 10,),
                            ThemedButton(
                              text: 'Book Appointment',
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => BookedConfirm()));
                              },
                              enabled: true,
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ])),
                ),
              

            ]),
          ],
        )));
  }
}

class Indicator extends StatefulWidget {
  Indicator(
      {@required this.text, @required this.text2, @required this.assetImage});

  final String text;
  final String text2;
  final String assetImage;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Icon(
            Icons.star,
            size: 20,
            color: Colors.yellow,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            widget.text2,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Image.asset(
            widget.assetImage,
            width: 200,
          )
        ]));
  }
}
