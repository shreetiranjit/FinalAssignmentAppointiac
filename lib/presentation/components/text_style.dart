import 'package:flutter/material.dart';

class StyleText {
  String fontFamily = "Roboto";
  double fontSize = 24;
  FontWeight fontWeight = FontWeight.normal;
  Color color = const Color(0xFF1D1D1F);
  TextDecoration? textDecoration;

  StyleText(this.color, this.fontFamily, this.fontWeight, this.fontSize , this.textDecoration); 
  
}