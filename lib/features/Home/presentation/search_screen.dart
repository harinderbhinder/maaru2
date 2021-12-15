import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/main.dart';

import 'create_home_screen.dart';

// class ProviderSearchScreen extends StatefulWidget {
//   @override
//   _ProviderSearchScreenState createState() => _ProviderSearchScreenState();
// }
//
// class _ProviderSearchScreenState extends State<ProviderSearchScreen> {
//   Color _iconColor = Colors.yellowAccent;
//   @override
//   Widget build(BuildContext context) {
//     var selectedIndex;
//     return Scaffold(
//         backgroundColor:MaaruColors.darkGrey2,
//         bottomNavigationBar: CreateHomeScreen(
//           selectedIndex: 1,
//           Color1:  selectedIndex == 1
//               ? MaaruColors.darkGrey2
//               : MaaruColors.textButtonColor
//           //  Color:Colors.red
//        // MaaruColors.textButtonColor
//         ),
//         body: SafeArea(
//             child: Column(children: [
//
//
// Stack(children:[
//   ShowLocation(),
//           MyClass(),
//           SizedBox(
//             height: 20,
//           ),
//           //  Padding(
//           //    padding: EdgeInsets.only(left: 20),
//           //
//           // child:PadExp
//
//               Padding(
//             padding: EdgeInsets.fromLTRB(10, 100, 0, 0),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Expanded(
//                     child: Padding(
//                         padding: EdgeInsets.only(
//                           top: 0,
//                           right: 10,
//                         ),
//                         child: TextFormField(
//                           // cursorColor: Colors.black,
//                           decoration: InputDecoration(
//                               enabledBorder: new OutlineInputBorder(
//                                   borderRadius: new BorderRadius.circular(10.7),
//                                   borderSide: new BorderSide(
//                                       color: Colors.grey[300], width: 1.0)),
//                               focusedBorder: new OutlineInputBorder(
//                                   borderRadius: new BorderRadius.circular(10.7),
//                                   borderSide: new BorderSide(
//                                       color: Colors.grey[300], width: 1.0)),
//                               hintText: 'Search',
//                               hintStyle: MaaruStyle.text.greyDisable,
//                               contentPadding:
//                                   EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                               fillColor: Colors.white,
//                               suffixIcon: Image.asset(
//                                 'assets/icons/icone-setting-19.png',
//                                 height: 50,
//                                 // width: 30,
//                               )),
//                         )),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Padding(
//                       padding: EdgeInsets.only(right: 70),
//                       child: InkWell(
//                           onTap: () {
//                             Navigator.of(context).push(
//                                 MaterialPageRoute(builder: (_) => MapView()));
//                           },
//                           child: Image.asset(
//                             'assets/icons/icon-bl-15.png',
//                             height: 40,
//                           ))),
//                 ]),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//
//           Padding(
//               padding: EdgeInsets.only(top: 320,right: 10,left: 10),
//               child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => BookAppointment1()));
//                   },
//                   child:      Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.grey[300])),
//                     height: 120,
//                     child: Container(
//                       color: Colors.white,
//                       margin: EdgeInsets.all(10),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                             ),
//                             child: Image.asset('assets/images/kutta.png'),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Franks Pet Lounge',
//                                 style: MaaruStyle.text.tiniest
//                               ),
//                               Text(
//                                 'Franks Daycare',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.star,
//                                     size: 25,
//                                     color: Colors.yellow,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     '42 Reviews   (4.0)',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold, fontSize: 12),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),)),
//         ])
//
//             //   ]
//             ])));
//   }
// }
//
// class MyClass extends StatefulWidget {
//   @override
//   _MyClassState createState() => _MyClassState();
// }
//
// class _MyClassState extends State<MyClass> {
//   bool pressGeoON = false;
//   bool cmbscritta = true;
//   bool isPressed = true;
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Padding(
//         padding: EdgeInsets.fromLTRB(20, 105, 10, 0),
//         child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50.0),
//               color: Colors.transparent,
//             ),
//             alignment: Alignment.bottomRight,
//             child: InkWell(
//                 child: Column(children: [
//                   cmbscritta
//                       ? Image.asset(
//                           'assets/icons/icon-bl-05.png',
//                           height: 40,
//                         )
//                       : Padding(
//                           padding: EdgeInsets.only(bottom: 20),
//                           child: Container(
//                             width: 500,
//                             height: 200,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     'assets/icons/icone-setting-62.png'),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.fromLTRB(10, 20, 30, 0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   InkWell(
//
//                                     onTap: () {
//                                       setState(() {
//                                         // isPressed = !isPressed;
//                                       });
//                                     },
//                                     child: Image.asset(
//                                       'assets/icons/icone-setting-49.png',
//                                       //   color:
//                                       //   isPressed ? Colors.white : Colors.blue,
//                                       height: 40,
//                                     ),
//                                   ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   // isPressed = !isPressed;
//                                 });
//                               },
//                               child:
//                                   Image.asset(
//                                     'assets/icons/icone-setting-71.png',
//                                     height: 40,
//                                   )),
//                                   Image.asset(
//                                     'assets/icons/icone-setting-72.png',
//                                     height: 40,
//                                   ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   // isPressed = !isPressed;
//                                 });
//                               },
//                               child:
//                                   Image.asset(
//                                     'assets/icons/icone-setting-73.png',
//                                     height: 40,
//                                   )),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   // isPressed = !isPressed;
//                                 });
//                               },
//                               child:
//                                   Image.asset(
//                                     'assets/icons/icone-setting-74.png',
//                                     height: 40,
//                                   )),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   // isPressed = !isPressed;
//                                 });
//                               },
//                               child:
//                                   Image.asset(
//                                     'assets/icons/icone-setting-75.png',
//                                     height: 40,
//                                   )),
//                                   // Padding(
//                                   //     padding:
//                                   //         EdgeInsets.fromLTRB(0, 100, 500, 0),
//                                   //     child: ToggleButton(
//                                   //       text1: 'hkd',
//                                   //       text2: 'hkjf',
//                                   //     )),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                 ]),
//                 //    style: TextStyle(fontSize: 14)
//                 onTap: () {
//                   setState(() {
//                     pressGeoON = !pressGeoON;
//                     cmbscritta = !cmbscritta;
//                   });
//                 })),
//       ),
//     ]);
//   }
// }
//



class ProviderSearchScreen extends StatefulWidget {
  @override
  _ProviderSearchScreenState createState() => _ProviderSearchScreenState();
}

class _ProviderSearchScreenState extends State<ProviderSearchScreen> {
  Color Groomingcolor = Color(0xff5e34d1);
  Color Vetcolor = Color(0xff5e34d1);
  Color Walkingcolor = Color(0xff5e34d1);
  Color hotelcolor = Color(0xff5e34d1);
  Color daycarecolor = Color(0xff5e34d1);

  String switchimage = 'assets/icons/icon-bl-19.png';

  double height = 45;
  double leftpad = 310;
  Container RepeatContainer(String image) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: MaaruColors.textfeildline, width: 2),
        ),
      height: 120,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(13.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  gradient:LinearGradient(colors: [Colors.black,Colors.grey.shade500]),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Franks Pet Lounge',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Pet Daycare',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/ffth.png',
                      height: 25,
                    ),
                    Text(
                      '38 Reviews (5.0)',
                      style:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color switchcolor = Color(0xff5e34d1);
  Color activecolor = Colors.red;

  Widget switchcontainer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(

      child: Column(
        children: [
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           Groomingcolor == Color(0xff5e34d1)
          //               ? Groomingcolor = Colors.red
          //               : Groomingcolor = Color(0xff5e34d1);
          //         });
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Groomingcolor),
          //         height: size.height * 0.05,
          //         width: size.width * 0.11,
          //         child: Image.asset(
          //           'assets/icons/icone-setting-55.png',
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: size.width * 0.05,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           Vetcolor == Color(0xff5e34d1)
          //               ? Vetcolor = Colors.red
          //               : Vetcolor = Color(0xff5e34d1);
          //         });
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10), color: Vetcolor),
          //         height: size.height * 0.05,
          //         width: size.width * 0.11,
          //         child: Image.asset(
          //           'assets/icons/icone-setting-56.png',
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: size.width * 0.05,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           hotelcolor == Color(0xff5e34d1)
          //               ? hotelcolor = Colors.red
          //               : hotelcolor = Color(0xff5e34d1);
          //         });
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10), color: hotelcolor),
          //         height: size.height * 0.05,
          //         width: size.width * 0.11,
          //         child: Image.asset(
          //           'assets/icons/icone-setting-57.png',
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: size.width * 0.05,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           daycarecolor == Color(0xff5e34d1)
          //               ? daycarecolor = Colors.red
          //               : daycarecolor = Color(0xff5e34d1);
          //         });
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10), color: daycarecolor),
          //         height: size.height * 0.05,
          //         width: size.width * 0.11,
          //         child: Image.asset(
          //           'assets/icons/icone-setting-58.png',
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: size.width * 0.05,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           Walkingcolor == Color(0xff5e34d1)
          //               ? Walkingcolor = Colors.red
          //               : Walkingcolor = Color(0xff5e34d1);
          //         });
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10), color: Walkingcolor),
          //         height: size.height * 0.05,
          //         width: size.width * 0.11,
          //         child: Image.asset(
          //           'assets/icons/icone-setting-59.png'
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: size.width * 0.05,
          //     ),
          //   ],
          // ),
    Row(
    children: [
    Container(

    decoration: BoxDecoration(border: Border.all(color: MaaruColors.textfeildline),borderRadius: BorderRadius.circular(5.0)),

    height: size.height*0.03,
    width: size.width*0.30,
    child: Center(child: Text('3-4 rating',style: TextStyle(fontSize: 10,color: MaaruColors.textfeildline),)),
    ),
    SizedBox(width: size.width*0.04,),
    Container(
    decoration: BoxDecoration(border: Border.all(color: MaaruColors.textfeildline),borderRadius: BorderRadius.circular(5.0)),
    height: size.height*0.03,
    width: size.width*0.28,
    child: Center(child: Text('4+ rating',style: TextStyle(fontSize: 10,color: MaaruColors.textfeildline),)),
    ),
    ],
    )

        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CreateHomeScreen(),
backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Container(
            margin:
            EdgeInsets.only(top: 70, bottom: 0, left: 20, right: 20),

            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ShowLocation(),
                SizedBox(
                  height: 15.0,
                ),
                Stack(
                  children: [
                    Container(

                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffE8E8E8)),
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 2.0, left: 20.0),
                            hintText: 'Search',
                            hintStyle: MaaruStyle.text.tiny,
                            suffixIcon: Image.asset(
                              'assets/icons/icone-setting-19.png',
                              height: 100,
                            ),
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 260),
                      child: GestureDetector(
                        onTap: (){setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));
                        });},
                        child: Image.asset(
                          'assets/icons/icone-setting-61.png',
                          height: 45,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: leftpad),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              switchimage == 'assets/icons/icon-bl-19.png'
                                  ? switchimage = 'assets/icons/icone-setting-62.png'
                                  : switchimage = 'assets/icons/icon-bl-19.png';
                              height == 45 ? height = 180 : height = 45;
                              leftpad == 310 ? leftpad = 0 : leftpad = 310;




                            });
                          },
                          child: Image.asset(
                            switchimage,
                            height: height,
                          )),
                    ),
                    Positioned(
                        left: 50, bottom: 50, child: switchcontainer(context)),

                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                RepeatContainer('assets/images/kutta.png',),
                SizedBox(
                  height: size.height * 0.02,
                ),
                RepeatContainer('assets/images/kutta.png',),
                SizedBox(
                  height: size.height * 0.02,
                ),
                RepeatContainer('assets/images/kutta.png',),
              ],
            )),
      ),
    );
  }
}



