import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';

///
/// Custom text theme
/// How to use:
/// Text("Hellow World",style: Theme.of(context).textTheme.headlineLarge)
///
///

const customTextTheme = TextTheme(
  headlineLarge: TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.4,
    color: black,
  ),
  headlineMedium: TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.4,
    color: black,
  ),
  headlineSmall: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.4,
    color: black,
  ),
  titleLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: black,
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: black,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: black,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: black,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: black,
  ),
);
