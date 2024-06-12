import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tsa/widgets/search_zone.dart';

class Messagerie extends StatefulWidget {
  const Messagerie({super.key});

  @override
  State<Messagerie> createState() => _MessagerieState();
  
}

class _MessagerieState extends State<Messagerie> {
  TextEditingController searchController = TextEditingController();
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    
  }
  Future<List<String>> _getDiscussion() async {
    var discussion = store.collection("discussion");
    var querySnapshot = await discussion.get();

    List<String> listDiscussion = [];
    for(var doc in querySnapshot.docs){
      listDiscussion.add(doc['title']);
    }
    return listDiscussion;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title:const  Text("Messagerie"),
        centerTitle: true,
        titleTextStyle:const  TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 21),
      ),

    );
  }
}
