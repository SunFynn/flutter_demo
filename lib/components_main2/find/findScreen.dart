import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class findScreen extends StatelessWidget {
  const findScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('发现页面', style: TextStyle(fontSize: 26),),
      )
    );
  }
}
