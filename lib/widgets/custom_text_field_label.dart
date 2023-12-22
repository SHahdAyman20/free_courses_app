import 'package:flutter/material.dart';

class CustomTextFieldLabel extends StatelessWidget {
   CustomTextFieldLabel({
    super.key,
    required this.icon,
    required this.label,
  });

  IconData icon;
  String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color:const Color(0xff333333),),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Text(
            label,
            style:const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Color(0xff333333)
            ),
          ),
        ),
      ],
    );
  }
}
