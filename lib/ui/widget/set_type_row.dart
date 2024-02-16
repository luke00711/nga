import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngax/utils/screen_utils.dart';
import 'package:ngax/widget/selection_widget.dart';
import 'package:ngax/widget/text_widget.dart';

class SetTypeWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final  String?  values;
  final Function? onTap;

  const SetTypeWidget({Key? key, this.title, this.subTitle, this.values, this.onTap}) : super(key: key);

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
        children: [
          Expanded(child:child(title)),
          SizedBox(width: 15.dp),
          Expanded(child: child(subTitle)),
          SizedBox(width: 15.dp),
          Expanded(child: SelectionWidget(text: values, onTap: onTap))
        ],
      ),
    );
  }
  Widget child(String? text){
    return MyTextWidget(text ?? '');
  }
}
