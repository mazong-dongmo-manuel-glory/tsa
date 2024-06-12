import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ButtonZone extends StatelessWidget {
  final Function () onPressed;
  final String text;
  final Color color;
  final Color backgroundColor;
  final double radius;
  const ButtonZone({super.key,required this.onPressed,required this.text,this.color =Colors.white,this.backgroundColor=Colors.indigo,this.radius=5});


  @override
  Widget build(BuildContext context){
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius)
        ),
        child: Center(child: Text(text,style:TextStyle(color: color,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}