import 'package:flutter/material.dart';

class AppFonts {
  static const syncopate = "Syncopate";
  static const rubik = "Rubik";
  static const barlow = "Barlow";
}

class AppFontWeight {
  /// Thin, the least thick
  static FontWeight get thin => FontWeight.w100;

  /// Extra-light
  static FontWeight get extraLight => FontWeight.w200;

  /// Light
  static FontWeight get light => FontWeight.w300;

  /// Normal / regular / plain
  static FontWeight get regular => FontWeight.w400;

  /// Medium
  static FontWeight get medium => FontWeight.w500;

  /// Semi-bold
  static FontWeight get semiBold => FontWeight.w600;

  /// Bold
  static FontWeight get bold => FontWeight.w700;

  /// Extra-bold
  static FontWeight get extraBold => FontWeight.w800;

  /// Black, the most thick
  static FontWeight get black => FontWeight.w900;
}
