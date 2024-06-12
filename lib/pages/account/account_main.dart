import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsa/pages/account/messagerie.dart';
import 'package:tsa/pages/account/profile.dart';
import 'package:tsa/pages/account/replay.dart';
import 'package:tsa/pages/home/home.dart';
import 'package:tsa/widgets/navigation_item.dart';

class AccountMain extends StatefulWidget {
  const AccountMain({super.key});

  @override
  State<AccountMain> createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain> {
  void logout() async {
    var auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) =>const  Home()));
  }
  final pages = const [Messagerie(),Replay(),Profile()];
  var page_index = 0;
  void changePage(int index){
    setState(() {
      page_index =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme()
      ),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child:pages[page_index],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          iconSize: 18,
          currentIndex: page_index,
          onTap: changePage,
          items: const  [
            BottomNavigationBarItem(icon: NavigationItem(number: "12", icon: Icons.message),label: "messagerie"),
            BottomNavigationBarItem(icon: Icon(Icons.movie),label: "replay et rapport"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
        ),
      ),
    );
  }
}
