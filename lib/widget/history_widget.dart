import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                //Text(v),
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
  }
}
