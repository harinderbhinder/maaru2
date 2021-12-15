import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> isSelected;
  bool pressed = true;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ToggleButtons(
        borderColor: Colors.grey[300],
        borderWidth: -0.0,
        fillColor: Color(0xffe2d6b8),
        selectedBorderColor: Colors.white,
        selectedColor: Colors.white,
        // borderRadius: BorderRadius.circular(
        //   10,
        // ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(68, 10, 68, 10),
            child: Text('MALE',
                style: pressed
                    ? MaaruStyle.text.toggel
                    : MaaruStyle.text.toggel,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(53, 10, 48, 10),
            child: Text('FEMALE',
                style: pressed
                    ? MaaruStyle.text.toggel
                    : MaaruStyle.text.toggel,),
          )
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
          setState(() {
            pressed = !pressed;
          });
        },
        isSelected: isSelected,
      )
    ]);
  }
}

enum Gender { male, female, none }

class ToggleButton2 extends StatefulWidget {
  @override
  _ToggleButton2State createState() => _ToggleButton2State();
}

class _ToggleButton2State extends State<ToggleButton2> {

  Gender SelectedGender = Gender.none;
  Color malecontainercolor = Colors.white;
  Color femalecontainercolor = Colors.white;
  String gender='none';

  Container ToggleContainer(
      double height, double width, String text, Color togglecolor) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE8E8E8)),
        color: togglecolor,
      ),
      child: Center(
          child: Text(
            text,
            style: MaaruStyle.text.toggel,
          )),
    );
  }


  // int index =['male','ddd','dddkd'] as int;
  // List<bool> isSelected;
  // bool pressed = true;
  // @override
  // void initState() {
  //   isSelected = [true, false];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    // return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //   ToggleButtons(
    //     borderColor: Colors.grey[300],
    //     borderWidth: -0.0,
    //     fillColor: MaaruColors.blueColor,
    //     selectedBorderColor: Colors.white,
    //     selectedColor: Colors.white,
    //     // borderRadius: BorderRadius.circular(
    //     //   10,
    //     // ),
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(40, 10, 100, 15),
    //         child: Text(
    //           'Male',
    //           style: pressed
    //               ? TextStyle(fontSize: 20, color: Colors.black)
    //               : TextStyle(fontSize: 20, color: Colors.white),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(54, 10, 54, 15),
    //         child: Text(
    //           'Female',
    //           style: pressed
    //               ? TextStyle(fontSize: 20, color: Colors.black)
    //               : TextStyle(fontSize: 20, color: Colors.white),
    //         ),
    //       ),
    //     ],
    //     onPressed: (int index) {
    //       setState(() {
    //         for (int i = 0; i < isSelected.length; i++) {
    //           isSelected[i] = i == index;
    //           pressed = !pressed;
    //         }
    //       });
    //     },
    //     isSelected: isSelected,
    //   ),
    // ]);
   return Row(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                SelectedGender = Gender.male;
                if(SelectedGender==Gender.male)
                  {
                    gender='MALE';
                    print(gender);
                  }else
                    {
                      print('null');
                    }
              });
            },
            child:ToggleContainer(
                size.height * 0.060,
                size.width * 0.45,
                'MALE',
                SelectedGender == Gender.male
                    ? MaaruColors.button2Color
                    : malecontainercolor)),
        GestureDetector(
            onTap: () {
              setState(() {
                SelectedGender = Gender.female;
                if(SelectedGender==Gender.female)
                {
                  gender='FEMALE';
                  print(gender);
                }else
                {

                  print('null');
                }
              });
            },
            child: ToggleContainer(
                size.height * 0.060,
                size.width * 0.44,
                'FEMALE',
                SelectedGender == Gender.female
                    ? MaaruColors.button2Color
                    : Colors.white)),
      ],
    );
  }
}
class ToggleButton3 extends StatefulWidget {
  @override
  _ToggleButton3State createState() => _ToggleButton3State();
}

class _ToggleButton3State extends State<ToggleButton3> {



  Color NeuteredContainerColor = Colors.white;
  Color activenutered = MaaruColors.button2Color;
  Color SpadeContainerColor = Colors.white;
  Color activespade = MaaruColors.button2Color;
  Color NeitherContainerColor = Colors.white;
  Color activeneither = MaaruColors.button2Color;

  String sex='none';


  Container ToggleContainer(
      double height, double width, String text, Color togglecolor) {



    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE8E8E8)),
        color: togglecolor,
      ),
      child: Center(
          child: Text(
            text,
            style: MaaruStyle.text.toggel,
          )),
    );
  }




  // List <bool>isSelected;
  // bool pressed = true;
  //
  // @override
  // void initState() {
  //   isSelected = [true, false,false];
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    // return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     mainAxisSize: MainAxisSize.min,
    //
    //     children: [
    //
    //   ToggleButtons(
    //     borderColor: Colors.grey[300],
    //     borderWidth: -0.0,
    //     fillColor: MaaruColors.redColor,
    //     selectedBorderColor: Colors.white,
    //     selectedColor: Colors.white,
    //     // borderRadius: BorderRadius.circular(
    //     //   10,
    //     // ),
    //     children:
    //     <Widget>[
    //       Padding(
    //         padding: EdgeInsets.fromLTRB(30, 10, 25, 15),
    //         child: Text('NEUTERED',
    //             style: pressed
    //                 ? GoogleFonts.poppins(
    //               textStyle: TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Poppins',
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w500),
    //             )
    //                 : GoogleFonts.poppins(
    //               textStyle: TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Poppins',
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w500),
    //             )),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.fromLTRB(40, 10, 35, 15),
    //         child: Text('SPADE',
    //             style: pressed
    //                 ? GoogleFonts.poppins(
    //               textStyle: TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Poppins',
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w500),
    //             )
    //                 : GoogleFonts.poppins(
    //               textStyle: TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Poppins',
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w500),
    //             )),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.fromLTRB(30, 10, 25, 15),
    //         child: Text('NEITHER',
    //             style: pressed
    //                 ? GoogleFonts.poppins(
    //               textStyle: TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Poppins',
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w500),
    //             )
    //                 : GoogleFonts.poppins(
    //               textStyle: const TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Poppins',
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w500),
    //             )),
    //       ),
    //     ],
    //
    //     onPressed: (int index) {
    //
    //       setState(() {
    //
    //
    //         print(isSelected);
    //         for (int i = 0; i < isSelected.length; i++) {
    //           isSelected[i] = i == index;
    //         }
    //       });
    //       setState(() {
    //
    //         if (isSelected == "L") {
    //           isSelected = "P" as List<bool> ;
    //         } else if (index == "P") {
    //           index = "A" as int ;
    //         }
    //         BlocProvider.of<PetProfileBloc>(context)
    //             .add(SexChanged(isSelected.toString()));
    //         pressed = !pressed;
    //       });
    //     },
    //
    //     isSelected: isSelected,
    //
    //   )
    // ]);


  return  Row(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                if (NeuteredContainerColor == Colors.white) {
                  NeuteredContainerColor = activenutered;
                  SpadeContainerColor = Colors.white;
                  NeitherContainerColor = Colors.white;
                } else {
                  NeuteredContainerColor = Colors.white;
                }

                if(NeuteredContainerColor==activenutered)
                  {
                    sex='NEUTERED';
                    print(sex);
                  }else
                    {
                      print('FAILURE');
                    }

              });
            },
            child: ToggleContainer(
                size.height * 0.060,
                size.width * 0.29,
                'Neutered',
                NeuteredContainerColor)),
        GestureDetector(
            onTap: () {
              setState(() {
                if (SpadeContainerColor == Colors.white) {
                  SpadeContainerColor = activespade;
                  NeuteredContainerColor = Colors.white;
                  NeitherContainerColor = Colors.white;
                } else {
                  SpadeContainerColor = Colors.white;
                }
                if(SpadeContainerColor==activespade)
                {
                  sex='SPADE';
                  print(sex);
                }else
                {
                  print('FAILURE');
                }

              });
            },
            child:ToggleContainer(
                size.height * 0.060,
                size.width * 0.30,
                'Spade',
                SpadeContainerColor)),
        GestureDetector(
            onTap: () {
              setState(() {
                if (NeitherContainerColor == Colors.white) {
                  NeitherContainerColor = activeneither;
                  SpadeContainerColor = Colors.white;
                  NeuteredContainerColor = Colors.white;
                } else {
                  NeitherContainerColor = Colors.white;
                }
                if(NeitherContainerColor==activeneither)
                {
                  sex='NEITHER';
                  print(sex);
                }else
                {
                  print('FAILURE');
                }

              });
            },
            child:ToggleContainer(
                size.height * 0.060,
                size.width * 0.30,
                'Neither',
                NeitherContainerColor)),
      ],
    );
  }
}