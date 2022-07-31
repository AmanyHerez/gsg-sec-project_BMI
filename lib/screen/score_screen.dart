import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:project2_flutter_gsg/screen/history_screen.dart';
import 'package:provider/provider.dart';

import '../models/bmi_model.dart';
import '../provider/bmi_provider.dart';

class ScoreScreen extends StatefulWidget {
  final int bmiScore;
  String height ;
  String weight;

  ScoreScreen({required this.bmiScore,required this.height,required this.weight,});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFA557FF),
        title: Text(
          "BMI Score",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Gabriela-Regular',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "your-score".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: 'Gabriela-Regular',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment('Underweight'.tr(), 18.5, Colors.red),
                  GaugeSegment('Normal'.tr(), 6.4, Colors.green),
                  GaugeSegment('Overweight'.tr(), 5, Colors.orange),
                  GaugeSegment('Obese'.tr(), 10.1, Colors.pink),
                ],
                valueWidget: Text(
                  widget.bmiScore.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 40, fontFamily: 'Gabriela-Regular'),
                ),
                currentValue: widget.bmiScore.toDouble(),
                needleColor: Colors.black,
              ),

              Text(
                bmiStatus ?? 'No_Result'.tr(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: bmiStatusColor!,
                    fontFamily: 'Gabriela-Regular'),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  bmiInterpretation!,
                  style: const TextStyle(
                      fontSize: 15, fontFamily: 'Gabriela-Regular'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async{
                  print('Amany Herez');
                 await PerformSave();
                    Navigator.pushNamed(context,'/history_screen');
                },
                child:  Text(
                  "save".tr(),
                  style: const TextStyle(
                      fontSize: 15, fontFamily: 'Gabriela-Regular'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFA557FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (widget.bmiScore > 30) {
      bmiStatus = 'Obese'.tr();
      bmiInterpretation = "Msg_Obese".tr();
      bmiStatusColor = Colors.pink;
    } else if (widget.bmiScore >= 25) {
      bmiStatus = 'Overweight'.tr();
      bmiInterpretation = "Msg_Overweight".tr();
      bmiStatusColor = Colors.orange;
    } else if (widget.bmiScore >= 18.5) {
      bmiStatus = 'Normal'.tr();
      bmiInterpretation = "Msg_Normal".tr();
      bmiStatusColor = Colors.green;
    } else if (widget.bmiScore < 18.5) {
      bmiStatus = 'Underweight'.tr();
      bmiInterpretation = "Msg_Underweight".tr();
      bmiStatusColor = Colors.red;
    }
  }
  Future<void> PerformSave() async{
    save();
    // clear();
  }
  Future<void> save() async{

    await  Provider.of<BmiProvider>(context,listen: false).create(bmi: bmi);
  }
  BmiModel get bmi{
    return BmiModel(height: widget.height, weight: widget.weight);
  }
  void clear(){
    //heightController.text=' ';
   // weightController.text=' ';

  }
}
