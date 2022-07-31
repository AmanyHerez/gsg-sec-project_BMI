import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project2_flutter_gsg/provider/bmi_provider.dart';
import 'package:project2_flutter_gsg/widget/history_widget.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( "history".tr(),),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context,BmiProvider value, child) {
              // if(value.bmis.isEmpty){
              //   return Center(child: Column(children: [
              //     Icon(Icons.warning)
              //   ],));
              // }
              return ListView.builder(

                  itemCount: value.bmis.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(value.bmis[index].height ?? " "),
                                Text(value.bmis[index].weight  ?? " "),
                                Text('27.4'),
                                Row(
                                  children: [CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 7,
                                  ),
                                    SizedBox(width: 3,),Text('وزن زائد')],
                                )
                              ],
                            ),
                            Spacer(),
                            Text("27/7/2022"),
                          ],
                        ),
                      ),
                    );
                  });

            },

          ),
        ));
  }
}
