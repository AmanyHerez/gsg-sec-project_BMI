class Contact{
  late int id;
  late String name;
  late String number;

  Contact({required this.name, required this.number});
  Contact.fromMap(Map<String,dynamic> rowMap){
    id=rowMap['id'];
    name=rowMap['name'];
    number=rowMap['number'];
  }
  Contact.toMap(){
    Map<String,dynamic> map=Map<String,dynamic>();
    map['name']=name;
    map['number']=number;
  }
}


