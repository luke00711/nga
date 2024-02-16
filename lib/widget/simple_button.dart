import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
   Color? backgroundColor ;
   Color? borderColor;
   Color? titleColor;
   String title;
   Function callback;
   FontWeight? fontWeight;
   double? height;
   double fontSize;
   BorderRadius? borderRadius;
   SimpleButton({Key? key, required this.title,this.backgroundColor, this.borderRadius , this.height = 45, this.fontSize = 18, this.borderColor, this.titleColor, this.fontWeight = FontWeight.normal, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:  borderRadius ?? BorderRadius.circular(10),
          border: borderColor != null ? Border.all(color: borderColor!,width: 1) : null

      ),
      height: height,
      width: double.infinity,
      child: Text(title,style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: titleColor ?? Colors.white,
      )),
    ),onTap: (){
      callback.call();
    });
  }
}
