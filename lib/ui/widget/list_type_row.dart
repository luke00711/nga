import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngax/constant/color_constant.dart';
import 'package:ngax/utils/screen_utils.dart';
import 'package:ngax/widget/selection_widget.dart';
import 'package:ngax/widget/text_widget.dart';
import 'package:ngax/widget/two_selection_widget.dart';

class ListTypeWidget extends StatelessWidget {
  final String? title;
  final List<Map<String,String>>? subTitle;
  final  String?  values;
  final Function(int)? onTap;
  final Function()? addValue;
  final Function(int)? onRemove;
  const ListTypeWidget({Key? key, this.title, this.subTitle, this.values, this.onTap, this.onRemove, this.addValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.dp),
      padding: EdgeInsets.only(left: 12.dp,right: 12.dp, top: 14.dp,bottom:  14.dp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: const Color(0xffDADADA),width: 1)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 59.dp, child:child(title)),
          SizedBox(width: 11.dp,),
          Expanded(child: Column(children: [
            ...?subTitle?.map((e){
              int index = subTitle?.indexOf(e) ?? 0;
              return  Padding(
               padding: EdgeInsets.only(bottom: 5.dp),
                child:   TwoSelectionWidget(text: e.keys.first, subText: e.values.first, onRemove: (){
                    onRemove?.call(index);
                },onTap: (){
                  onTap?.call(index);
                }),
              );
            }).toList(),
            TwoSelectionWidget(text: "+", onTap: addValue, textColor: ColorConstant.mainBlue,)
          ]))
        ],
      ),
    );
  }
  Widget child(String? text){
    return MyTextWidget(text ?? '', textAlign: TextAlign.left);
  }
}
