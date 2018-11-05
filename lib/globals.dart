// Use this file to define Global variables for the App.

import 'definitions.dart';

// Global Variables list
bool termsAndConditionsAccepted = true;
GivDoUser givDoUser; // This is the App User

// Various methods to verify user TextForm inputs (credentials)
String verifyUserEmail(String inputEmail) {
  return inputEmail.contains('@') ? null : 'Not a valid Email!';
}

String verifyUserPassword(String inputPassword) {
  return inputPassword.length >= givdo_password_minimal_length
      ? null
      : 'Password must be at least $givdo_password_minimal_length characters';
}

// Class definition of the App user
class GivDoUser {
  String userEmail;
  String userPassword;
  GivDoUserProfile profile = GivDoUserProfile.new_player;
  GivDoUserState state = GivDoUserState.signed_out;

  set givDoUserEmail(newEmail) {
    print('Givdo User calss:');
    print(givDoUser);
    print('NewEmail $newEmail');
    if (null != newEmail) givDoUser.userEmail = newEmail;
  }

  set givDoUserPassword(newPassword) {
    print('NewPassword $newPassword');
    if (null != newPassword) givDoUser.userPassword = newPassword;
  }
}

enum GivDoUserProfile {
  new_player,
  existing_player,
}

enum GivDoUserState { signed_in, signed_out }
