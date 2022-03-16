import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class identifyScreen extends StatefulWidget {
  const identifyScreen({Key? key}) : super(key: key);

  @override
  _identifyScreenState createState() => _identifyScreenState();
}

class _identifyScreenState extends State<identifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('识花'),
          centerTitle: true,
        ),
        body: Container(
          child: Text('识花页面', style: TextStyle(fontSize: 26),),
        )
    );
  }
}
