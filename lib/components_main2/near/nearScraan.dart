import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class nearScreen extends StatelessWidget {
  const nearScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('附近'),
          centerTitle: true,
        ),
        body: Container(
          child: Text('附近页面', style: TextStyle(fontSize: 26),),
        )
    );
  }
}
