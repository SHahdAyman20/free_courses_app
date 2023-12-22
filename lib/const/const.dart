
import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xff1A4C6E);

void navigateTo(context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) =>  screen,
    ),
  );
}

