import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsa/pages/account/account.dart';
import 'package:tsa/pages/home/confirm.dart';
import 'package:tsa/pages/home/home.dart';
import 'package:tsa/pages/home/ResetAccount.dart';
import 'package:tsa/widgets/button_zone.dart';
import 'package:tsa/widgets/input_zone.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State createState()=>LoginState();
}

class LoginState extends State<Login>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailError = false;
  bool passwordError = false;
  bool viewPassword = false;
  List<String> errorMessage = [];

  void login()async{
    errorMessage = [];
    passwordError = false;
    emailError = false;

    final RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );
    if(!emailRegExp.hasMatch(emailController.text)){
      emailController.clear();
      setState(() {
        errorMessage.add("Email invalide");

        emailError = true;
      });

    }
    if(passwordController.text.length < 6){
      passwordController.clear();
      setState(() {
        errorMessage.add("Mot de passe trop court minimum  6 carracteres");

        passwordError = true;
      });
    }
    if(errorMessage.isNotEmpty){
      return;
    }

    var auth = FirebaseAuth.instance;
    try{
      UserCredential user = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      print(user.user?.emailVerified);
      if(!(user.user!.emailVerified)){
        print("one");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Confirmation()));

      }else{
        print("two");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Account()));

      }

    }on FirebaseAuthException catch(e){
      switch(e.code){
        case "user-not-found":
          emailController.clear();
          setState(() {
            errorMessage.add("Le compte n'existe pas");
            emailError = true;
          });
          break;
        case "invalid-email":
          emailController.clear();

          setState(() {
            errorMessage.add("Email invalide");
            emailError = true;
          });
          break;
        case "wrong-password":
          passwordController.clear();
          setState(() {
            errorMessage.add("Mot de passe incorrecte");
            passwordError = true;

          });
          break;
        default:
          setState(() {
            errorMessage.add("identifiant incorrecte");
          });

      }
    }

  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CupertinoButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
          },
          child:const  Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      Text("Ha, te revoila !",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      Text("Nous somme heureux de te revoir !")
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("INFORMATION DU COMPTE",style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Text(errorMessage.join("\n"),style:const TextStyle(color: Colors.redAccent),),
                      const SizedBox(height: 10,),
                      InputZone(hintText: "Email", obscureText: false, controller: emailController, errorState: emailError),
                      const SizedBox(height: 10,),
                      InputZone(hintText: "Mot de passe", obscureText: true, controller: passwordController, errorState: passwordError),
                      TextButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetAccount()));

                          },
                          iconAlignment: IconAlignment.start,
                          child: const Text(
                            "Tu as oublie ton mot de passe ?",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                      ),
                      ButtonZone(onPressed: login, text: "Connexion")
                    ],
                  )
                ],
              ),
            )
          ),
      )
    );
  }
}