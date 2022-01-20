import '/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController with ChangeNotifier {
  // object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserModel? userDetails;

  // fucntion for google login
  googleLogin() async {
    this.googleSignInAccount = await _googleSignIn.signIn();
    // inserting values to our user details model

    this.userDetails = new UserModel(
      displayName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
    );

    // call
    notifyListeners();
  }

  // function for facebook login
  facebooklogin() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );

    // check the status of our login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name",
      );

      this.userDetails = new UserModel(
        displayName: requestData["name"],
        email: requestData["email"],
      );
      notifyListeners();
    }
  }

  // logout

  logout() async {
    this.googleSignInAccount = await _googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    userDetails = null;
    notifyListeners();
  }
}
