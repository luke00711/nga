import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:ngax/dialog/input_data_dialog.dart';
import 'package:ngax/model/data_model.dart';
import 'package:ngax/model/model.dart';
import 'package:ngax/ui/widget/list_type_row.dart';
import 'package:ngax/ui/widget/set_type_row.dart';
import 'package:ngax/ui/widget/string_type_row.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final dataBean =  DataBean();
  List<DataModel> list  = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBean.parseData();
    list = dataBean.dataList;//.where((element) => element.type == DataType.setType).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(padding: EdgeInsets.only(top: 0,left: 16,right: 16), itemBuilder: (context,index){
        DataModel dataModel = list[index];
        switch(dataModel.type){
            // TODO: Handle this case.
          case DataType.setType:
          return SetTypeWidget(title: dataModel.title, subTitle: dataModel.subTitle, values: dataModel.values, onTap: (){
            showEditDialog(dataModel);
          });
            // TODO: Handle this case.
          case DataType.stringType:
            return StringTypeWidget(title: dataModel.title, subTitle: dataModel.subTitle, values: dataModel.values, onTap: (){
              showEditDialog(dataModel);
            });
          case DataType.listMapType:
            return ListTypeWidget(title: dataModel.title, subTitle: dataModel.listValue, values: dataModel.values, onTap: (index){
              showEditDialog(dataModel,index: index);
            }, onRemove: (index){
                dataModel.listValue?.removeAt(index);
                setState(() {
                });
            },addValue: (){
              showEditDialog(dataModel,index: index, isAdd:  true);
            });
            // TODO: Handle this case.
        }

      },itemCount: list.length),
    );
  }


  void showEditDialog(DataModel model,{int? index, bool isAdd = false}){
    SmartDialog.show(
      alignment: Alignment.center,
      useSystem: true,
      builder: (_) {
        return  InputDataDialog(title: model.dialogTitle(), contentTitle: model.titleContent(),contentHint: model.hintContent(), contentValue: isAdd ? model.emptyContent() : model.valueContent(index:  index), onTap: (result){
            if(isAdd){
              model.addValue(result);
            }else{
              model.parseValue(result, index: index);
            }
            setState(() {

            });
        });
      },
    );
  }
}
