import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contanior extends StatefulWidget {
  const Contanior({Key? key}) : super(key: key);

  @override
  _ContaniorState createState() => _ContaniorState();
}

class _ContaniorState extends State<Contanior> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    var str = '1';
    return GestureDetector(
        /* 点击事件 */
        onScaleStart: (a){
          print('start');
        },
         onScaleUpdate: (a){
           print('update');
         },
        onTap: (){
          print('123123123');
          setState(() {
            count++;
            str = '文本';
          });
        },

        /* 长按事件 */
        onLongPress: (){
          print('长按事件');
        },

        child: Container(
          color: Colors.red,
          child: Wrap(
            children: [
              new Text('手势事件容器, 点击次数：${count}'),
              new Text('${str}')
            ],
          ),
          width: 100,
          height: 100,
        )
    );
  }
}
