import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 文章
class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        "文章",
        style: TextStyle(
          fontSize: 30
        )
      ), 
    );
  }
}