
//import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';

import '../../domain/usecases/email_auth_params.dart';
import '../../error/exception.dart';

class UserNotFoundException extends AuthException {}

class BadCredentialsAuthExceptions extends AuthException {}

class EmailAlreadyInUseAuthException extends AuthException {}

/// This class provides basic starting point for any kind of [AuthSource]
/// Any class that implements has to implement their own signup method
/// to become an [AuthSource]. When user is successfully created on remote,
/// this will return [UserCredentials] on success or throw [Exception]
/// finishSignup step which actually creates user on Triffic Servers will use
/// the credentials from local disk after this is called.
///
abstract class AuthSource {
   Future<Either<void, Unit>> signInWithGoogle();
   Future<void> signOut();

   Future<CognitoUserPoolData> emailSignup(EmailAuthParams params);
   Future<CognitoUserPoolData> emailLogin(EmailAuthParams params);
   Future<void>forgetpassword (email);
   Future<bool> verifyOtp(VerifyParams params);
}
