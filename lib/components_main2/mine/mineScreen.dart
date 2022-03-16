import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mineScreen extends StatelessWidget {
  const mineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
      ),
        body: Container(
          child: Text('我的页面', style: TextStyle(fontSize: 26),),
        )
    );
  }
}
