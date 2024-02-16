import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final Color textColor;
  const MyTextWidget(this.text,{Key? key, this.textAlign = TextAlign.center, this.textColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',textAlign: textAlign, style:   TextStyle(
      color: textColor,
      fontSize: 12
    ));
  }
}
