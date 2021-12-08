
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/dialog.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile4.dart';

import '../../../main.dart';
import 'register_pet_profile_screen2.dart';

class CreateRegisterPetProfile3 extends StatefulWidget {
  @override
  _CreateRegisterPetProfile3State createState() =>
      _CreateRegisterPetProfile3State();
}

class _CreateRegisterPetProfile3State extends State<CreateRegisterPetProfile3> {

  TextEditingController _nameEditingController ;
  TextEditingController _controller;
  bool priceupdate_value = true;
  TextEditingController _walkingController;
  TextEditingController _feedingController;
  TextEditingController _tempramentController;
  TextEditingController _nameController;
  TextEditingController _timesController;
  TextEditingController _notesController;

  @override
  void dispose() {
    _nameEditingController.dispose();
    _controller.dispose();
    super.dispose();
  }
  List<int> userSearchItems = [];
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  var nameTECs = <TextEditingController>[];
  var ageTECs = <TextEditingController>[];
  var jobTECs = <TextEditingController>[];
  List<Container> containers = List <Container>();

  Container createContainer() {
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    var jobController = TextEditingController();
    nameTECs.add(nameController);
    ageTECs.add(ageController);
    jobTECs.add(jobController);
    return
      Container(color: Color(0xFFffffff),

      child: Column(
      //  mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //Text('Person ${cards.length + 1}'),
          if (priceupdate_value)
          TextFormField(
            textInputAction: TextInputAction.next,

            controller: _nameEditingController,
            decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: MaaruStyle.text.greyDisable),
          ),
          SizedBox(
            height: 30,
          ),
          if (priceupdate_value)
          TextFormField(
            textInputAction: TextInputAction.next,
            onChanged: (text) {

            },
            controller: _nameController,
            decoration: InputDecoration(
                hintText: 'How many times a day?',
                hintStyle: MaaruStyle.text.greyDisable),
          ),
          SizedBox(
            height: 30,
          ),
          if (priceupdate_value)
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: 'Note',
                  hintStyle: MaaruStyle.text.greyDisable,
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                      BorderSide(color: Colors.grey[50]))),
              onChanged: (text) {},
              controller: _notesController,
            ),

          SizedBox(height: 10,),
          InkWell(onTap: (){
            setState(() {
              _removeWidget();
            });
          },
         child: Row(children: [
          ElevatedButton(

            onPressed: () {

            },
            child: Icon(Icons.remove, color: Colors.white,),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
              primary: Colors.red, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            ),
          ),
            Text('Remove Vaccine',style:GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color(0xFFc72019))))
        ],
      )),
    ])
    );
  }

  @override
  void initState() {
    super.initState();
    containers.add(createContainer());
    _nameEditingController = TextEditingController();
    _controller = TextEditingController();
    _feedingController = TextEditingController();
    _nameController = TextEditingController();
    _notesController = TextEditingController();
    _tempramentController = TextEditingController();
    _timesController = TextEditingController();
    _walkingController = TextEditingController();
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < containers.length; i++) {
      var name = nameTECs[i].text;
      var age = ageTECs[i].text;
      var job = jobTECs[i].text;
      entries.add(PersonEntry(name, age, job));
    }
    Navigator.pop(context, entries);
  }
  _onRemove() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < containers.length; i--) {
      var name = nameTECs[i].text;
      var age = ageTECs[i].text;
      var job = jobTECs[i].text;
      entries.add(PersonEntry(name, age, job));
    }
    Navigator.pop(context, entries);
  }
  final GlobalKey<State> _keyLoader =  GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
     child: Scaffold(
        backgroundColor: MaaruColors.DogsBackground,

        body: BlocBuilder<PetProfileBloc, PetProfileState>(builder: (context, state) {
          if (state is pet3rofileButtonTapped) {

          }


          return SingleChildScrollView(
            //  physics: ScrollPhysics(),
            child:
            Column(children: [
              SizedBox(height: 40,),
              SkipButtons(),

              SizedBox(
                height: 20,
              ),
              Align(alignment: Alignment.bottomRight, child:
              Container(
                  alignment: Alignment.bottomRight,
                  height: size.height * 0.25,
                  width: size.width * 0.9,
                  child: BackgroundImage(
                    assetImage: 'assets/images/kutta.png',
                  ))),

              Container(
                //  width: 1000,
                // height: 1300,
                  alignment: FractionalOffset.bottomCenter,
                  decoration: BoxDecoration(
                      color: Color(0xFFffffff),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Max',
                                style: MaaruStyle.text.large,
                                textAlign: TextAlign.left),
                            Text(
                              'Jack  Russell',
                              style: MaaruStyle.text.tiny,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 40,
                              height: 20,
                            ),
                            Text(
                              'Walking Schedule',
                              style: MaaruStyle.text.tiniest,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: 'Note',
                                  hintStyle: MaaruStyle.text.greyDisable,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                      borderSide:
                                      BorderSide(color: Colors.grey[50]))),
onSaved: (text){

                                _walkingController.text;
},
                              controller : _walkingController,

                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Feeding Schedule',
                              style: MaaruStyle.text.tiniest,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: 'Note',
                                  hintStyle: MaaruStyle.text.greyDisable,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                      borderSide:
                                      BorderSide(color: Colors.grey[50]))),

                              controller: _feedingController,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Temperament',
                              style: MaaruStyle.text.tiniest,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: 'Note',
                                  hintStyle: MaaruStyle.text.greyDisable,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                      borderSide:
                                      BorderSide(color: Colors.grey[50]))),

                              controller: _tempramentController,
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    'Medication',
                                    style: MaaruStyle.text.tiniest,
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 60,
                                  ),
                                  Text('No', style: MaaruStyle.text.tiniest),

                                  Switch(
                                    activeColor: MaaruColors.buttonColor,
                                    inactiveThumbColor: MaaruColors.buttonColor,
                                    // title: Text("Do you want to update your price?"),
                                    // controlAffinity: ListTileControlAffinity.leading,

                                    value: priceupdate_value,

                                    onChanged: ( bool pridddceupdateValue) {
                                      setState(() {

                                        priceupdate_value = pridddceupdateValue;


                                        print(priceupdate_value);
                                      });
                                    },
                                  ),
                                  // ),
                                  Text('Yes', style: MaaruStyle.text.tiniest),
                                ]),
                            if (priceupdate_value)
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: containers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return containers[index];
                                },
                              ),


                            TextButton.icon(
                              onPressed: () async {
                                setState(() =>
                                    containers.add(createContainer()));
                              },

                              icon: Image.asset(
                                'assets/icons/icone-setting-64.png',
                                height: 40,
                              ),
                              label: Text(
                                'Add More Vaccines',
                                style: MaaruStyle.text.tiniest,
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  CreateRegisterPetProfile4()));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          shape: BoxShape.circle),
                                      child: Text(
                                        'Back',
                                        style: MaaruStyle.text.greyDisable,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        //
                                        // BlocProvider.of<PetProfileBloc>(
                                        //     context)
                                        //     .add(Profile3(
                                        //
                                        //  _tempramentController.text,
                                        //   _timesController.text,
                                        //   _feedingController.text,
                                        //   _notesController.text,
                                        //   _nameEditingController.text,
                                        //    _walkingController.text,
                                        //   _nameController.text,
                                        // ));
                                        Navigator.of(context)
                                            .push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    CreateRegisterPetProfile3()));

                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                            'assets/images/next (2).png'),
                                      )),
                                ]),
                          ])))
            ]),
            //floatingActionButton:
            // FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
          );
        })));
  }
  _removeWidget() {
    if (containers.length > 0) {
      containers.removeLast();
    }
  }
}

class showButtomSheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          decoration: BoxDecoration(
              color: Color(0xFFffffff),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30))),

          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (text) {},
                    // controller: _nameEditingController,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: MaaruStyle.text.greyDisable),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (text) {},
                    //   controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'How many times a day?',
                        hintStyle: MaaruStyle.text.greyDisable),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: 'Note',
                        hintStyle: MaaruStyle.text.greyDisable,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap:(){
                      AlertManager.showSuccessMessage( "Add Success", context);

                      Navigator.pop(context);},
                child:  RoundedButton(
                    buttonName: 'Add',
                    Color1: MaaruColors.primaryColorsuggesion,
                    Color: MaaruColors.blueColor,
                  ))
                ],
              ),
            ),
          ))
    ]);
  }

  }

