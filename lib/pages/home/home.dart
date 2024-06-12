import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tsa/pages/account/Account.dart';
import 'package:tsa/pages/home/Login.dart';
import 'package:tsa/pages/home/ResetAccount.dart';
import 'package:tsa/pages/home/SingUp.dart';
import 'package:tsa/widgets/button_zone.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _checkUser();
    super.initState();
  }

  void _checkUser() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Account()),
        );
      });


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset("assets/background.jpg", fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "BIENVENUE SUR LA PLATEFORME DE TONTINE STRUCTURELLE AFRICAINE",
                            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Connectez-vous ou inscrivez-vous pour faire partie de cette aventure !",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ButtonZone(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SingUp()),
                              );
                            },
                            text: "S'inscrire",
                            backgroundColor: Colors.white,
                            color: Colors.black,
                            radius: 20,
                          ),
                          ButtonZone(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            },
                            text: "Connexion",
                            radius: 20,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
