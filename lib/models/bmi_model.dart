class BmiModel{
  static late  int id;
  String? height;
   String? weight;

  BmiModel({required this.height, required this.weight});
  BmiModel.fromMap(Map<String,dynamic> rowMap){
    id=rowMap['id'];
    height=rowMap['height'];
    weight=rowMap['number'];
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> map=Map<String,dynamic>();
    map['height']= height;
    map['weight']=weight;
    return map;
  }
}


