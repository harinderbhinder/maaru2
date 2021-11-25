import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
//import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


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
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';


class UserRepositoryImpl implements UserRepository {
//  final AuthSource authSource;
  final SharedPrefHelper sharedPrefHelper;

  UserRepositoryImpl(this.sharedPrefHelper);
  EncryptedSharedPreferences encryptedSharedPreferences = EncryptedSharedPreferences();
  @override
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params) async {
    try {
      var map = new Map<String, String>();
      map [MaruConstant.first_name] = params.first_name;
      map[MaruConstant.last_name] = params.lName;
      map[ MaruConstant.email] = params.email;
      map [MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'user';
      final response = await http.post(MaruConstant.signup,
          body: map
      );

      print("Register Success  ${response.body}");

      if (response.statusCode == 200) {
        //  await authSource.emailSignup(params);
        return
          Right('Otp sent your register email');
      }
      else {
        return Left(UnknownFailure("Already registered account"));
      }
    }

    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> emailLogin(EmailAuthParams params) async {
    try {

      var map = new Map<String, String>();

      map[ MaruConstant.email] = params.email;
      map [MaruConstant.password] = params.password;

      final response = await http.post(MaruConstant.signin,
          body: map
      );
    //  sharedPrefHelper.saveString('access-token','value');
      print("$MaruConstant.token");
      print('Response status: ${response.statusCode}');

      sharedPrefHelper.saveEmail(params.email);
      if (response.statusCode == 200) {
        await encryptedSharedPreferences.setString( MaruConstant.token, 'value').then((bool success) {
          if (success) {
            print('Response body: ${response.body}');
            print('success');
            print(MaruConstant.token);
          } else {
            print('fail');
          }
        });
        sharedPrefHelper.saveString(MaruConstant.first_name, params.first_name);
        sharedPrefHelper.saveString(MaruConstant.last_name, params.lName);
        sharedPrefHelper.saveString(MaruConstant.email, params.email);
      //  sharedPrefHelper.saveString('access-token', MaruConstant.token);
      //  print("res['data']token  :${"token"}");
        // sharedPrefHelper.saveString (MaaruConstant. );
        // print('save String:${accessToken}');
        return
          Right(Void);
      }
      else {
        return Left(UnknownFailure("Need to verify Account"));
      }
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> resendOtp(String email) async {
    try {
      var map = new Map<String, String>();
      map[ MaruConstant.email] = email;
      final response = await http.post(MaruConstant.resend,
          body: map
      );
      print("Register Success  ${response.body}");


      return
        Right(Void);
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }
  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      var map = new Map<String, String>();
      map[ MaruConstant.otp] = email;
      final response = await http.post(MaruConstant.reset,
          body: map
      );
      print("Register Success  ${response.body}");


      return
        Right(Void);
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> petCreateProfile(params) {
    // TODO: implement petProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> createPetProfile(PetProfileParams params) async {
    try {
      var token =  await encryptedSharedPreferences.getString(MaruConstant.token).then((String value) {
        if (value != null) {
         // print('Response body: ${response.body}');
          print(value);
          print(MaruConstant.token);
        } else {
          print('fail');
        }

      });
      var map = new Map<String, String>();
      map [MaruConstant.age] = params.age;
      map[MaruConstant.pet_name] = 'kl;dkdk';
      map[MaruConstant.birth_date] = params.birthDate;
      map[MaruConstant.breed_type] =params.breadType;
      map[MaruConstant.weight] =params.weight;
      map[MaruConstant.height] = params.height;
      map[MaruConstant.sex] = 'jdkjdkj';
      map[MaruConstant.img] = 'assets/images/abin1.png';


   // final headers = {"access-token":'$token'};
    //{"access-token":'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo2OCwiZmlyc3RfbmFtZSI6InAiLCJsYXN0X25hbWUiOiJzIiwidXNlcl90eXBlIjoidXNlciIsImVtYWlsIjoic2h1YmhhbTM2MzZAeW9wbWFpbC5jb20iLCJ0b2tlbiI6bnVsbCwicGFzc3dvcmQiOiIkMmEkMDgkbE9MVi50U2FpR0wuY0JVd05xeTFTZXpTSE1hRWhMUHN5OThncmlObEVyRkg3TXpjWFd5aW0iLCJvdHAiOiJ2S29HcyIsImlzX3ZlcmlmaWVkIjoiMSIsImNyZWF0ZWRBdCI6IjIwMjEtMTEtMjRUMTI6MjY6MDMuMDAwWiIsInVwZGF0ZWRBdCI6IjIwMjEtMTEtMjRUMTI6MjY6MjAuMDAwWiJ9LCJpYXQiOjE2Mzc3NTY4MDYsImV4cCI6MTYzNzg0MzIwNn0.DHluj_NeQFBXnEeDF4_Ag-kbX5YwWcUsDIM05eVUPG8'};

      //print;("$token");
    final msg = {MaruConstant.pet_name: params.petName,MaruConstant.age:params.age,MaruConstant.birth_date:params.birthDate,
      MaruConstant.breed_type:params.breadType,MaruConstant.height:params.height,MaruConstant.weight:params.weight,MaruConstant.sex:params.sex,
    };


    final response = await post(MaruConstant.createpProfile, headers: {"access-token":"$token"}, body:map);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    return
      Right(Void);
    }
    catch (e) {
      print("Thrown Exception While create IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> createUserProfile() {
    // TODO: implement createUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getPastAppointment() {
    // TODO: implement getPastAppointment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getPetProfile() {
    // TODO: implement getPetProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUpcomingAppointment() {
    // TODO: implement getUpcomingAppointment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> savePetProfile(PetProfileParams params) async {
    try {
      var map = new Map<String, String>();
      map [MaruConstant.age] = params.age;
      map[MaruConstant.birth_date] = params.birthDate;
      map[ MaruConstant.img] = params.profileImage;
      // map [MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'User';
      final response = await http.post(MaruConstant.savepet1,
          body: map
      );
      print("Register Success  ${response.body}");
      // sharedPrefHelper.saveString(MaruConstant.first_name, params.first_name);
      // sharedPrefHelper.saveString(MaruConstant.last_name, params.lName);
      // sharedPrefHelper.saveString(MaruConstant.email, params.email);
      if (response.statusCode == 200) {
        //  await authSource.emailSignup(params);
        return
          Right(Void);
      }
      else {
        return Left(UnknownFailure("Already registered account"));
      }
    }

    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }
  @override
  Future<Either<Failure, void>> saveUserProfile(UserProfileParams params) {
    // TODO: implement saveUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> setNewPassword(
      {String email, String otp, String password}) {
    // TODO: implement setNewPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyCode(VerifyParams params) async {
    try {
      var map = Map<String, String>();
      map[ MaruConstant.otp] = params.code;
      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.verify,
          body: map
      );
    print(response.body);

      return
        Right(Void);
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> getHomeSearchBarItems() {
    // TODO: implement getHomeSearchBarItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getResentMessages() {
    // TODO: implement getResentMessages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUserSaveAccountLocation() {
    // TODO: implement getUserSaveAccountLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUserPayment() {
    // TODO: implement getUserPayment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveUserPayment(PaymentParams params) {
    // TODO: implement saveUserPayment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getDayCareSearchIcons() {
    // TODO: implement getDayCareSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getGroomingSearchIcons() {
    // TODO: implement getGroomingSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getHomeSearchIcons() {
    // TODO: implement getHomeSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getHospitalSearchIcons() {
    // TODO: implement getHospitalSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getVetSearchIcons() {
    // TODO: implement getVetSearchIcons
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> getWalkingSearchIcons() {
    // TODO: implement getWalkingSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveRegistrationId() {
    // TODO: implement saveRegistrationId
    throw UnimplementedError();
  }

}
