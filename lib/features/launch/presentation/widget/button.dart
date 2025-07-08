import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: color,
        //border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(2))
      ),

      child: Text(text, style: TextStyle(
        color: Colors.white
      ),),
    );
  }
}
