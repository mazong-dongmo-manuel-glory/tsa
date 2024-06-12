import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tsa/firebase_options.dart';
import 'package:tsa/pages/home/confirm.dart';
import 'package:tsa/pages/home/home.dart';
import 'package:tsa/model.dart';
import 'package:tsa/pages/home/Login.dart';
import 'package:tsa/pages/home/ResetAccount.dart';
import 'package:tsa/pages/home/SingUp.dart';
import 'package:tsa/pages/home/politique.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(create: (context)=>Model(),child: const MyApp(),)
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme()
      ),
      routes: {
        '/':(context)=>const Home(),
        '/login': (context)=>const Login(),
        '/singup':(context)=>const SingUp(),
        '/reset':(context)=>const ResetAccount(),
        '/privacy':(context)=>const PrivacyPolicy(),
        '/confirm':(context)=>const Confirmation(),
      },

    );
  }
}