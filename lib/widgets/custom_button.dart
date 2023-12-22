import 'package:flutter/material.dart';
import 'package:free_courses_app/const/const.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  VoidCallback onPressed;
  String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.9
        ,
            MediaQuery.of(context).size.height * 0.07
        ),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(title,
      style: GoogleFonts.acme(
        color: Colors.white,
        fontSize: 25
      ),),
    );
  }

}
