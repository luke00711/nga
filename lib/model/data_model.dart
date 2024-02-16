
import 'model.dart';

class DataModel {
  String? title;
  String? subTitle;
  String? values;
  DataType type  = DataType.stringType;
  List<Map<String,String>>? listValue;


  String dialogTitle(){
    switch(type){
      case DataType.setType:
        return title ?? '';

      case DataType.stringType:
        return '';

      case DataType.listMapType:
        return title ?? '';
    }
  }

  List<String?>? titleContent(){
    switch(type){
      case DataType.setType:
        {
          List<String?> result = [];
          subTitle?.split("/").forEach((element) {
            result.add('${element}（单位:%)');
          });
          return result;
        }

      case DataType.stringType:
        return [title];

      case DataType.listMapType:
        return ['職種',' 割合(単位：%)'];
    }
 }

  List<String?>? hintContent(){
    switch(type){
      case DataType.setType:
        {
          List<String?> result = [];
          subTitle?.split("/").forEach((element) {
            result.add('$element前年度中途採用比率');
          });
          return result;
        }

      case DataType.stringType:
        return [title];

      case DataType.listMapType:
        return ['職種を入力してください', '割合を入力してください'];
    }
  }


  List<String?>? valueContent({int? index}){
    switch(type){
      case DataType.setType:
        {
          List<String?>? result = [];
          result =  values?.split('%');
          result?.removeLast();
          return result;
        }
      case DataType.stringType:
        {
          String num =  extractNumbersFromString(values!);
          return [num];
        }
      case DataType.listMapType:
        return [listValue?[index ?? 0].keys.first, extractNumbersFromString(listValue?[index ?? 0].values.first ?? '')];
    }

  }

  List<String?>? emptyContent(){
    return ['',''];
  }

  String extractNumbersFromString(String input) {
    RegExp regEx =  RegExp("[0-9.]"); // 定义正则表达式，匹配连续的数字
    Iterable<Match> matches = regEx.allMatches(input); // 查找所有匹配项

    List<String> numbers = [];
    for (var match in matches) {
      numbers.add(match.group(0) ?? ''); // 将每个匹配项添加到列表中
    }

    return numbers.join('');
  }

  String getUnit(){
    switch(type){

    // TODO: Handle this case.
      case DataType.setType:
        return '%';

    // TODO: Handle this case.
      case DataType.stringType:
        String num =  extractNumbersFromString(values!);
        return values?.substring(num.length,values?.length) ?? '';

      case DataType.listMapType:
        return '';
      // TODO: Handle this case.

    }
   return '';
  }
  void parseValue(List<String?>? result, {int? index}){
    switch(type){
    // TODO: Handle this case.
      case DataType.setType:
        values = result?.join('%');
        values = '$values%';
      break;

    // TODO: Handle this case.
      case DataType.stringType:{
        values = '${result?.first}${getUnit()}';
      }
      break;

      case DataType.listMapType:{
        listValue?[index ?? 0] = {result?.first ?? '': '${result?.last}%'};
      }
    }

  }

  void addValue(List<String?>? result, {int? index}){
    Map<String,String> temp = {result?.first ?? '': '${result?.last}%'};
    listValue?.add(temp);
  }
}