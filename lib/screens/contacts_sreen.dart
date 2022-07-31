import 'package:flutter/material.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact'),),
      body: ListView.builder(itemCount: 5,itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.person),
          title: Text('title'),
          subtitle: Text('subTitle'),
        );

      },),
    );
  }
}
