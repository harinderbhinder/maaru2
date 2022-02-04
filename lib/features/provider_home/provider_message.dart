import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/custom_card.dart';
import 'package:maru/features/chat/presentation/chatt_screen.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_home/presentation/provider_chat.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;

class ProviderMessages extends StatefulWidget {
  // const Messages({Key key}) : super(key: key);

  @override
  _ProviderMessagesState createState() => _ProviderMessagesState();
}

class _ProviderMessagesState extends State<ProviderMessages> {
  @override
  Widget build(BuildContext context) {
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    var selectedIndex;
    return Scaffold(
        backgroundColor: Color(0xFFffffff),
        bottomNavigationBar: CreateProviderHome(
            selectedIndex: 3,
            Color2: selectedIndex == 3
                ? Colors.grey[300]
                : MaaruColors.textButtonColor
            //Color:MaaruColors.textButtonColor
            ),
        body: BlocProvider(
          create: (context) => KiwiContainer().resolve<LoginBloc>(),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginInitial) {
              BlocProvider.of<LoginBloc>(context).add(event.GetCustomers());

              return const CircularProgressIndicator();
            } else if (state is CustomerLoaded) {
              return SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                      child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),

                    // Align(
                    //     alignment: Alignment.centerRight,
                    //
                    //         child:
                    Container(
                      alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
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

                    Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 20, left: 10),
                        child: TextFormField(
                          // cursorColor: Colors.black,
                          decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.7),
                                  borderSide: new BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.7),
                                  borderSide: new BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              hintText: 'Search',
                              hintStyle: MaaruStyle.text.greyDisable,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 25.0, 10.0),
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
                        '   Providers',
                        style: MaaruStyle.text.small,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.getUserModel.customers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                  leading: Container(
                                height: 100,
                                width: 200,
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ProfileAvatar(
                                        imageUrl: state
                                            .getUserModel
                                            .customers[index]
                                            .firstName
                                            .toString(),
                                        avatarRadius: 60,
                                        width: 90,
                                        Color: Colors.yellow,
                                      ),
                                      ProfileAvatar(
                                        imageUrl:
                                            'assets/images/istockphoto-1179420343-612x612.jpg',
                                        avatarRadius: 60,
                                        width: 90,
                                        Color: Colors.yellow,
                                      ),
                                    ]),
// title: Padding(padding: EdgeInsets.only(right: 30),child:
// Align(alignment: Alignment.centerLeft,child:
// ProfileAvatar(
//   imageUrl: 'assets/images/Russo-Alessandro-Eric-20.jpg',
//   avatarRadius: 60,
//   width: 90,
//   Color: Colors.yellow,
// ),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Chat2(
                                            user: state.getUserModel.customers[index].id.toString(),
                                      //  image: state.getUserModel.customers[index].firstName.toString(),
                                          )));
                                },
                                child: Column(children: [
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 20),
                                          child: Container(
                                              height: 120,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[50],
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Center(
                                                child: ListTile(
                                                  leading:  ProfileAvatar(
                                                    imageUrl:
                                                        ('assets/images/istockphoto-1179420343-612x612.jpg'),
                                                    width: 50,
                                                    avatarRadius: 60,
                                                    Color: Colors.yellow,
                                                  ),
                                                  title: Text(
                                                    state
                                                        .getUserModel
                                                        .customers[index]
                                                        .firstName
                                                        .toString(),
                                                    style: MaaruStyle.text.tiny,
                                                  ),
                                                  subtitle: Text(
                                                    'Are we meeting tommarow still pet services'
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey),
                                                  ),
                                                  trailing: Text(
                                                    'today'.toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              )))),
                                ]),
                              )
                            ],
                          );
                        }),
                  ])));
            } else {
              return const CircularProgressIndicator();
            }
            ;
          }),
        ));
  }
}
