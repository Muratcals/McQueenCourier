import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.title,
    required this.fontsize,
     this.color,
     this.fontWeight,
  });

  final String title;
  final double fontsize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) =>
    Text(
      title,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: color ?? Colors.black,
          fontSize: fontsize,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: "times"),
    );
}



