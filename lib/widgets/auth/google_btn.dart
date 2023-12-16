import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';

import '../../root_screen.dart';
import '../../services/my_app_functions.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key});

  Future<void> _googleSignIn({required BuildContext context}) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: "400327053375-t3kmtnr4ni88tht4q0p029senq1u11eq.apps.googleusercontent.com",
      );
      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          final authResult = await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            ),
          );
        }
      }

      Fluttertoast.showToast(
        msg: "Đăng nhập thành công!",
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );

      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        Navigator.pushReplacementNamed(context, RootScreen.routeName);
      });
    } on FirebaseAuthException catch (error) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: error.message.toString(),
        fct: () {},
      );
    } catch (error) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: error.toString(),
        fct: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        padding: const EdgeInsets.all(6.0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      icon: const Icon(
        Ionicons.logo_google,
        color: Colors.red,
        size: 16,
      ),
      label: const Text(
        "Sign in with Google",
        style: TextStyle(color: Colors.black, fontSize: 10),
      ),
      onPressed: () async {
        await _googleSignIn(context: context);
      },
    );
  }
}
