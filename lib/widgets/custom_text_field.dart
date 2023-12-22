import 'package:flutter/material.dart';
import 'package:free_courses_app/const/const.dart';
// i made this class to refactor the code cuz i will make 4 text field
// and now i won't be forced to write the same code of text field 4 timed
// i will just call class 4 times in 4 lines 🤩
class CustomTextField extends StatelessWidget {

  TextInputType type;
  TextInputAction action;
  IconButton? suffixIcon;
  bool obscureText;
  String hintText;
  TextEditingController controller;
  final bool? enable;
  FormFieldValidator validator;

  CustomTextField(
      {super.key,
        required this.type,
        required this.action,
        this.suffixIcon,
        this.obscureText=false,
        required this.hintText,
        required this.controller,
        required this.validator,
        this.enable,
      });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      enabled: enable,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: type,
      textInputAction: action,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(20)//<-- SEE HERE
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
      ),
    );
  }
}