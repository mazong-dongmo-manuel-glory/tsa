import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchZone extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function() onTap;
  const SearchZone({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onTap
  });

  @override
  State createState() => SearchZoneState();
}

class SearchZoneState extends State<SearchZone> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding:const  EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      margin:const  EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.grey),
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
      ),
    );
  }
}
