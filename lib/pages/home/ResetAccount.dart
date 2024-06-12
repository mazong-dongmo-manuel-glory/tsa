import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsa/pages/home/confirm.dart';
import 'package:tsa/pages/home/home.dart';
import 'package:tsa/widgets/button_zone.dart';
import 'package:tsa/widgets/input_zone.dart';

class ResetAccount extends StatefulWidget {
  const ResetAccount({super.key});

  @override
  State createState() => ResetAccountState();
}

class ResetAccountState extends State<ResetAccount> {
  TextEditingController emailController = TextEditingController();
  bool emailError = false;
  List<String> errorMessage = [];

  void resetPassword() async {
    errorMessage = [];
    emailError = false;

    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(emailController.text)) {
      setState(() {
        errorMessage.add("Email invalide");
        emailError = true;
      });
      return;
    }

    var auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: emailController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Confirmation()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage.add(e.message ?? "Une erreur s'est produite");
        emailError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Réinitialiser le compte',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Text(
                      "Réinitialiser votre mot de passe",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Entrez votre adresse e-mail pour recevoir un lien de réinitialisation.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ADRESSE E-MAIL",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      errorMessage.join("\n"),
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                    const SizedBox(height: 10),
                    InputZone(
                      hintText: "Email",
                      obscureText: false,
                      controller: emailController,
                      errorState: emailError,
                    ),
                    const SizedBox(height: 20),
                    ButtonZone(
                      onPressed: resetPassword,
                      text: "Envoyer le lien de réinitialisation",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
