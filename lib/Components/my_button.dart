import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final double fontSize;
  final void Function()? onPressed;
  const MyButton({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.text,
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height,
        width: width,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: color,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          onPressed: onPressed,
          child: Text(
            "GO TO HOME",
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
