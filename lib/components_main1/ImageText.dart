import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageText extends StatelessWidget {
  const ImageText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              // 水平加载元素，Row超出并不会换行展示，最后超出的元素会怪异展示
              Row(
                // 水平剧中对齐方式
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '浪里个浪123123',
                  ),
                  new Image.asset(
                    'assets/images/1.jpeg',
                    width:100,
                    height:100,
                  ),
                  new Image(image: new NetworkImage("https://lmg.jj20.com/up/allimg/4k/s/02/210925005U45505-0-lp.jpg"), width: 50,)
                ],
                // ),
              ),
              Row(
                // child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '浪里个浪123123',
                  ),
                  new Image.network(
                      'https://lmg.jj20.com/up/allimg/4k/s/02/210925005U45505-0-lp.jpg',
                      width:100,
                      height:100,
                      fit: BoxFit.fill  // 不添加此属性，图片不会变形，此属性是填充的意思
                  ),
                  new CircleAvatar(backgroundImage: new NetworkImage('https://lmg.jj20.com/up/allimg/4k/s/02/210925005U45505-0-lp.jpg'), radius: 50)
                ],
                // ),
              ),
              Column(
                children: <Widget>[
                  new Text(
                      '文本五年',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: new TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      )
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '123123213123123123123',
                  ),
                ],
              )
            ]
        );
  }
}
