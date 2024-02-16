import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngax/utils/screen_utils.dart';



class MyTextField extends StatelessWidget {
  String? hintText;
  Function(bool value)? onFocus;
  Function(String value)? onChanged;
  Function(String value)? onSubmitted;
  Color? color;
  Color? inputColor;
  bool? secureText;
  double? fontSize;
  String? value;
  double? padding;
  List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  bool? autoFocus;
  MyTextField({Key? key, this.hintText, this.padding, this.value, this.fontSize, this.onChanged,this.onSubmitted, this.onFocus, this.autoFocus, this.inputFormatters,this.controller, this.color, this.inputColor = Colors.white, this.secureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: padding  ?? dp(5),right: padding  ?? dp(5)),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: color
      ),
      child: Focus(
        onFocusChange: (value){
          onFocus?.call(value);
        },
        child: TextField(

          keyboardType: TextInputType.number,
          controller: controller ?? TextEditingController()..text = value ?? '',
          obscureText: secureText ?? false,
          onChanged: onChanged,
          style:  TextStyle(
               fontSize: fontSize,
              color: inputColor
          ),
          onSubmitted: onSubmitted,
          autofocus: autoFocus ?? false,
          decoration: InputDecoration(
              border:  InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Color(0xff999999),
                  fontSize: 13
              )
          ),
        ),
      ),
    );
  }
}

