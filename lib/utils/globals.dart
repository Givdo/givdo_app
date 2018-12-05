// Use this file to define Global variables for the App.

import '../UI/definitions.dart';

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
  String firstName;
  String lastName;
  String email;
  String userPassword;
  GivDoUserProfile profile = GivDoUserProfile.new_player;
  GivDoUserState state = GivDoUserState.signed_out;

  set givDoUserlastName( lastName ) {
      try {

        givDoUser.lastName = lastName;
      } catch (e) {
        print(e.toString());
      }
  }

  set givDoUseremail( email) {
    try {
      givDoUser.email = email;

    } catch (e) {
      print(e.toString());
    }
  }

  set givDoUserfirstName(firstName) {
    try {
      givDoUser.firstName = firstName;

    } catch (e) {
      print(e.toString());
    }
  }

  set givDoUserEmail(newEmail) {
    if (newEmail != null)
      try {
        givDoUser.userEmail = newEmail;
      } catch (e) {
        print(e.toString());
      }
  }

  set givDoUserPassword(newPassword) {
    if (newPassword != null)
      try {
        givDoUser.userPassword = newPassword;
      } catch (e) {
        print(e.toString());
      }
  }
}

enum GivDoUserProfile {
  new_player,
  existing_player,
}

enum GivDoUserState { signed_in, signed_out }
