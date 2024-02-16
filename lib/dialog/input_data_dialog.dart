import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:ngax/constant/color_constant.dart';
import 'package:ngax/constant/image_constant.dart';
import 'package:ngax/utils/screen_utils.dart';
import 'package:ngax/utils/style_utils.dart';
import 'package:ngax/widget/simple_button.dart';
import 'package:ngax/widget/widget_textfield.dart';

class InputDataDialog extends StatefulWidget {
  final String title;
  final List<String?>? contentTitle;
  final List<String?>? contentHint;
  final List<String?>? contentValue;
  final Function(List<String?>?)? onTap;
  const InputDataDialog({Key? key, required this.title, this.contentTitle, this.contentHint, this.contentValue, this.onTap}) : super(key: key);

  @override
  State<InputDataDialog> createState() => _InputDataDialogState();
}

class _InputDataDialogState extends State<InputDataDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 289,
      padding: EdgeInsets.only(left: 16.dp,right: 16.dp,top: 16.dp, bottom: 24.dp),
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        image: DecorationImage(image: AssetImage(ImageConstant.dialogGradient), fit: BoxFit.fitHeight)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(visible: widget.title.isNotEmpty == true, child: Column(
            children: [
              Text(widget.title,style:titleColorAndFontSize16W500Style()),
              SizedBox(height: 18.dp),
            ],
          )),
          buildContent(),
          SimpleButton(backgroundColor: ColorConstant.mainBlue, title: '确定 ',callback: (){

            bool? emptyContent =  widget.contentValue?.where((element) => element?.isEmpty == true).isNotEmpty;
            if(emptyContent == true){
              SmartDialog.showToast('内容不能为空');
              return;
            }
            widget.onTap?.call(widget.contentValue);
            SmartDialog.dismiss();
          })
        ],
      ),
    );
  }

  Widget buildContent(){
    if(widget.contentTitle == null){
      return const SizedBox();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.contentTitle!.map((e)  {
          int index = widget.contentTitle?.indexOf(e) ?? 0;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(e ?? ''),
                  SizedBox(height: widget.contentTitle?.length == 1 ? 12.dp : 4.dp)
                ],
              ),
              MyTextField( color: const Color(0xffF5F5F5),inputColor: Colors.black, hintText:getValue(widget.contentHint,index) ,fontSize: 12.sp, padding: 10.dp, value: getValue(widget.contentValue,index),onChanged: (value){
                widget.contentValue?[index] = value.isEmpty ? '-' : value;
              }),
              SizedBox(height: 18.dp )
            ],
          );
        }).toList(),
      ] ,
    );
  }
  String getValue(List<String?>? list, int index){
    return list?.isEmpty == true? '': list?[index] ?? '';
  }

}
