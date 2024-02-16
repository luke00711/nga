import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngax/utils/screen_utils.dart';
import 'package:ngax/widget/text_widget.dart';

import '../constant/image_constant.dart';

class TwoSelectionWidget extends StatelessWidget {
  final String? text;
  final String? subText;
  final Function? onTap;
  final Function? onRemove;
  final Color textColor;
  const TwoSelectionWidget({Key? key, this.text, this.subText, this.onTap, this.onRemove, this.textColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            onTap?.call();
          },
          child: Container(
            margin: EdgeInsets.only(left: 5.dp,right: 5.dp,top:8.dp),
            height: 32.dp,
            decoration: BoxDecoration(
              color: const Color(0xff007FFF).withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: DottedBorder(
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
                  child: Row(
                    children: [
                      Expanded(child: MyTextWidget(text, textColor: textColor,)),
                      Visibility(visible: subText?.isNotEmpty == true, child:     Expanded(child: MyTextWidget(subText)))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(visible:  subText?.isNotEmpty == true, child: Align(
          alignment: Alignment.topRight,
          child: InkWell(
            child: Container(
              margin: EdgeInsets.only(bottom: 10.dp),
              width: 16.dp,
              height: 16.dp,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.remove, color: Colors.white,size: 16.dp),
            ),
            onTap: (){
                onRemove?.call();
            },
          ),
        ))
      ],
    );

  }
}
