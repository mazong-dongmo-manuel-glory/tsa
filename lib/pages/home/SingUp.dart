import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsa/pages/home/confirm.dart';
import 'package:tsa/pages/home/home.dart';
import 'package:tsa/pages/home/politique.dart';
import 'package:tsa/widgets/button_zone.dart';
import 'package:tsa/widgets/input_zone.dart';
class SingUp extends StatefulWidget {
  const SingUp({super.key});
  @override
  State createState()=>SingUpState();
}

class SingUpState extends State<SingUp>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailError = false;
  bool passwordError = false;
  bool viewPassword = false;
  List<String> errorMessage = [];

  void singup()async{
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
      UserCredential user = await auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      await user.user?.sendEmailVerification();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Confirmation()));

    }on FirebaseAuthException catch(e){
      switch(e.code){
        case "email-already-in-use":
          emailController.clear();
          setState(() {
            errorMessage.add("Le compte existe deja");
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
        case "weak-password":
          passwordController.clear();
            setState(() {
              errorMessage.add("Mot de passe invalide");
              passwordError = true;

            });
            break;
        default:
          setState(() {
            errorMessage.add("Verifier votre connexion impossible de creer l'utilisateur");
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
                        Text("Ha, bienvenue !",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        Text("Nous sommes heureux de voir un nouveau !")
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PrivacyPolicy()));

                          },
                          iconAlignment: IconAlignment.start,
                          child: const Text(
                            "Voir notre Politique de confidentialite",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        ButtonZone(onPressed: singup, text: "S'inscrire")
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