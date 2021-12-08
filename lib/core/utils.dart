

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/notification.dart';
import 'package:maru/core/data/datasource/storage.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/chat/domain/usecases/get_text_file.dart';
import 'package:maru/features/chat/presentation/chat_bloc.dart';
import 'package:maru/features/forgot/Domain/usecases/forget_password.dart';

import 'package:maru/features/forgot/Domain/usecases/reset_password.dart';
import 'package:maru/features/forgot/Domain/usecases/send_reset_otp.dart';
import 'package:maru/features/forgot/presentation/bloc/reset_bloc.dart';
import 'package:maru/features/login/domain/usecases/emailsignin.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/provider_login/domain/usecases/provider_email_login.dart';
import 'package:maru/features/provider_register/domain/usecases/provider_email_register.dart';
import 'package:maru/features/register/domain/usecases/email_signup.dart';
import 'package:maru/features/register/presentation/register_bloc.dart';
import 'package:maru/features/verify/domain/usecases/change_password.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_registration_id.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/auth_source.dart';
import 'data/datasource/shared_pref_helper.dart';
import 'data/datasource/user_service.dart';
import 'data/repository/user_repository.impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/resend_verification_code.dart';

Future<void> registerDependencyInjection() async {
  var container = KiwiContainer();

  await _registerMisc(container);
  await _registerApiClient(container);
  await _registerDataSources(container);
  _registerRepositories(container);
  _registerUseCases(container);
  _registerBloc(container);
}

void _registerBloc(KiwiContainer container) {
  container.registerFactory((c) => RegisterBloc(
        c.resolve(),c.resolve()
      ));
  container
      .registerFactory((c) => LoginBloc(c.resolve(),c.resolve(), c.resolve(),c.resolve(),c.resolve(),));
   container.registerFactory((c) => ResetBloc(c.resolve(), c.resolve(),c.resolve()));
   container.registerFactory((c) => PetProfileBloc(c.resolve(),c.resolve(),c.resolve(),c.resolve(),c.resolve(),c.resolve(),c.resolve()));
  // container.registerFactory((c) => KProfileBloc(c.resolve(), c.resolve()));
  container.registerFactory(
    (c) => VerifyBloc(c.resolve(), c.resolve(),c.resolve(),c.resolve(), c.resolve() ));
  container.registerFactory(
          (c) => ChatBloc(c.resolve(), c.resolve(),c.resolve() ));
}

void _registerUseCases(KiwiContainer container) {
  container.registerFactory((c) => EmailSignin(c.resolve()));
  container.registerFactory((c) => EmailSignup(c.resolve()));
  container.registerFactory((c) => ProviderEmailSignin(c.resolve()));
  container.registerFactory((c) => ProviderEmailSignUp(c.resolve()));
   container.registerFactory((c) => ResendCode(c.resolve()));
   container.registerFactory((c) => SendResetPasswordOtp(c.resolve()));
   container.registerFactory((c) => VerifyCode(c.resolve()));
   container.registerFactory((c) => SavePetProfile(c.resolve()));
   container.registerFactory((c) => GetPetProfile(c.resolve()));
   container.registerFactory((c) => CreatePetProfile(c.resolve()));
   container.registerFactory((c) => ForgetPassword(c.resolve()));
   container.registerFactory((c) => ResetPassword(c.resolve()));
  container.registerFactory((c) => SaveUserProfile(c.resolve()));
  container.registerFactory((c) => SaveChangePassword(c.resolve()));
  container.registerFactory((c) => SaveUserPayment(c.resolve()));
  container.registerFactory((c) => GetTextFile(c.resolve()));
  // container.registerFactory((c) => SaveSingleField(c.resolve()));
}

void _registerRepositories(KiwiContainer container) {
  container.registerFactory<UserRepository>(
      (c) => UserRepositoryImpl(c.resolve(),c.resolve() ));
}
_registerDataSources(KiwiContainer container) {
  container.registerFactory<AuthSource>(
          (c) => UserService(c.resolve(), c.resolve(), c.resolve()));
  container.registerFactory<SharedPrefHelper>(
          (c) => SharedPrefHelperImpl(c.resolve()));
}


_registerApiClient(KiwiContainer container) {}

_registerMisc(KiwiContainer container) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  container.registerFactory((c) => sharedPreferences);
  container.registerFactory((c) => Storage(sharedPreferences));
  container.registerFactory((c) => new CognitoUserPool(
   MaruConstant.poolid, MaruConstant.clientid));
}
