

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/icons.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/login/presentation/login_screen.dart';


import 'dart:ffi';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';



import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/auth_source.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';
import 'package:flutter/scheduler.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as https;
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';

import 'bloc/register_bloc.dart';
import 'bloc/register_state.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool enabled = false;

  TextEditingController _fnameController;
  TextEditingController _lnameController;
  TextEditingController _passwordController;
  TextEditingController _cnfpasswordController;
  TextEditingController _emailController;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _emailController = TextEditingController();
    _lnameController = TextEditingController();
    _cnfpasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _cnfpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:


      SingleChildScrollView(
        child: SafeArea(
        child:
          Column(
            children: [


            // BlocBuilder<RegisterBloc,RegisterState>(
            //   builder: (context,state){
            //     return
            //   },
            //
            //     )

              Logo(),
              ScreenIcon(),
             const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'or sign up with email',
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ThemedTextField("First Name", TextInputType.name,
                            textinputaction2: TextInputAction.next,
                            onChanged: (text) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //  .add(FNameChanged(text));
                        }, editingController: _fnameController),
                        SizedBox(
                          height: 5,
                        ),
                        ThemedTextField("Last Name", TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (text) {
                          //   BlocProvider.of<RegisterBloc>(context)
                          //  .add(LNameChanged(text));
                        }, editingController: _lnameController),
                        SizedBox(
                          height: 5,
                        ),
                        ThemedTextField("Email", TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (text) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //  .add(EmailChanged(text));
                        }, editingController: _emailController),
                        SizedBox(
                          height: 5,
                        ),
                        ThemedTextField(
                          "Password",
                          TextInputType.number,
                          textInputAction: TextInputAction.done,
                          password: true,
                          onChanged: (text) {
                            //  BlocProvider.of<RegisterBloc>(context)
                            //   .add(PasswordChanged(text));
                          },
                          editingController: _passwordController,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ThemedButton(
                          text: "Join",
                          onPressed: ()  {

                            String fname = _fnameController.text;
                            String lname = _lnameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;

                            if (fname.isEmpty) {
                              AlertManager.showErrorMessage(
                                  "Please enter first name", context);
                            } else if (lname.isEmpty) {
                              AlertManager.showErrorMessage(
                                  "Please enter last name", context);
                            } else if (validateEmail(email) != null) {
                              AlertManager.showErrorMessage(
                                  "Please enter valid email", context);
                            } else if (password.length < 6) {
                              AlertManager.showErrorMessage(
                                  "Password must be 6 characters long",
                                  context);

                              enabled = true;
                            }


                            // else if (password != cnfpassword) {
                            //   AlertManager.showErrorMessage(
                            //       "Password do not match", context);

                            else  {
                              // AlertManager.disclaimerPopup(context, onSuccess: () {
                              // BlocProvider.of<RegisterBloc>(context);
                               AlertManager.showSuccessMessage( "Success", context);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CreateregisterPetProfile1()));}



                          }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GoToSignInText(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Text for showing at bottom of screen
/// Tapping on it should take user to reset password screen
class GoToSignInText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already a member? ',
          style: MaaruStyle.text.medium,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            child: Text(
              'Log in',
              style: MaaruStyle.text.mediumDisable,
            ))
      ],
    );
  }
}
