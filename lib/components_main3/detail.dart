import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('详情页'),
      ),
      body: Center(
        child: Text('详情页'),
      ),
    );
  }
}
