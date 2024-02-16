import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngax/utils/screen_utils.dart';
import 'package:ngax/widget/text_widget.dart';

import '../constant/image_constant.dart';

class SelectionWidget extends StatelessWidget {
  final String? text;
  final Function? onTap;
  const SelectionWidget({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap?.call();
      },
      child: Container(
        height: 32.dp,
        decoration: BoxDecoration(
          color: const Color(0xff007FFF).withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),

        child: Stack(
          children: [
            DottedBorder(
              dashPattern: [8, 3],
              strokeWidth: 1,
              color: Colors.blue,
              borderType: BorderType.RRect,
              radius: Radius.circular(5),
              padding: EdgeInsets.all(6),

              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  width: double.infinity,
                  child: MyTextWidget(text),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,

                child:  Container(

                  margin: EdgeInsets.only(bottom: 4,right: 4),
                  child: Image.asset(ImageConstant.iconEditor, width: 16, height: 16,),
                )
            )
          ],
        ),
      ),
    );
  }
}
