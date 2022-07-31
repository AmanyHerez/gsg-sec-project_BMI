import 'package:flutter/material.dart';
import 'package:project2_flutter_gsg/screen/home_screen.dart';
class TestScreen extends StatelessWidget {


TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'enter text'
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(text: controller.text,),
                ));

          }, child: Text('go'),),
        ],
      ),

    );
  }
}
