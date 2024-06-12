
import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget{
  final String number;
  final IconData icon;
  const NavigationItem({super.key,required this.number, required this.icon});

  @override
  Widget build(BuildContext context){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 2,),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red
            ),
            child: Text(
              number,
              style:const  TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
            ),
          )
        ],
    );
  }

}