import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputZone extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final bool errorState;

  const InputZone({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.errorState,
  });

  @override
  State createState() => InputZoneState();
}

class InputZoneState extends State<InputZone> {
  late bool isTextObscured;

  @override
  void initState() {
    isTextObscured = widget.obscureText;
    super.initState();
  }

  void toggleObscureText() {
    setState(() {
      isTextObscured = !isTextObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5),
        border: widget.errorState ?  Border.all(color: Colors.redAccent,width: 1.5)  : null
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: isTextObscured,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          suffix: widget.obscureText
              ? GestureDetector(
            onTap: toggleObscureText,
            child: Icon(
              size: 17,
              isTextObscured ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
              color: Colors.black54,
            ),
          )
              : null,
        ),
      ),
    );
  }
}
