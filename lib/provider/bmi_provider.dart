import 'package:flutter/cupertino.dart';
import 'package:project2_flutter_gsg/controllers/bmi_db_controller.dart';
import 'package:project2_flutter_gsg/models/bmi_model.dart';

class BmiProvider extends ChangeNotifier{
  List<BmiModel> bmis=<BmiModel>[];
  BmiDbController _bmiDbController=BmiDbController();
  Future<void> read() async{
    bmis=await _bmiDbController.read();
    notifyListeners();
  }
  Future<bool> create({required BmiModel bmi}) async{
    print('Amany Herez');
    int id=await _bmiDbController.create(bmi);
    if(id!=0){
      BmiModel.id=id;
      bmis.add(bmi);
      notifyListeners();

    }
   return id!=0;
  }

}