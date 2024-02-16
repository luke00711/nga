
import 'data_model.dart';

enum DataType {
  setType, // Map<String, Map<String, String>>：Map<String, String>
  stringType, // Map<String, String>
  listMapType, // Map<String, List<Map<String, String>>>：List<Map<String, String>>
}



class DataBean {
  Map<String, dynamic> data =
  {
    // Map<String, Map<String, String>> '10%20%30%' 可以编辑
    '中途採用比率': {'前年度/2年度前/3年度前', '10%20%30%'},
    '中途採用比率2': {'前年度/2年度前/3年度前', '10%20%30%'},
    // Map<String, String> value(如：'18.5年') 可以编辑
    '正社員の平均継続勤務年数': '18.5年',
    '従業員の平均年齢': '50.5岁',
    '月平均所定外労働時間': '18時間',
    '平均の法定時間外労働60時間以上の労働者の数': '15人',
    // Map<String, List<Map<String, String>>> List<Map<String, String>> 可以编辑，可删除 Map<String, String>，并且可以无限增加 Map<String, String>
    '育児休業取得率（男性）': [
      {'正社員': '34%'},
      {'専門職': '50%'},
    ],
    '育児休業取得率（女性）': [
      {'正社員': '44%'},
      {'専門職': '10%'},
    ],
  };
  List<DataModel> dataList = [];

  void parseData(){
    data.keys.forEach((element) {
      DataModel dataModel = DataModel();
      dataModel.title = element;
      final  value =  data[element];
      if(value is Set){
        dataModel.type = DataType.setType;
        Set<String> temp = value as Set<String>;
        dataModel.subTitle = temp.first;
        dataModel.values = temp.last;
      }else if(value is String){
        dataModel.type = DataType.stringType;
        dataModel.values = value.toString();
      }else{
        dataModel.type = DataType.listMapType;
        dataModel.listValue = value;
      }
      dataList.add(dataModel);
    });
  }

}

