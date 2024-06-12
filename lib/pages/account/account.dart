import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsa/pages/account/account_main.dart';
import 'package:tsa/pages/home/confirm.dart';
import 'package:tsa/pages/home/home.dart';
import 'package:tsa/pages/home/Login.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  void navigateTo(BuildContext context, Widget page) {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User? user = snapshot.data;
          if (user == null) {
            navigateTo(context, const Login());
          }

          user!.reload().then((_){
            user = FirebaseAuth.instance.currentUser;
            if (user!.emailVerified) {
              navigateTo(context, const AccountMain());
            } else {
              navigateTo(context, const Confirmation());
            }
          }).catchError((_){
          });

        } else if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Veuillez vérifier votre connexion")),
          );
          navigateTo(context, const Home());
        }

        return Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black87,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
