import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  var value;

  get floatingActionButton => null;
  Widget build(BuildContext context) {

    List<DropdownMenuItem> getListData(){
      List<DropdownMenuItem> items = [];
      DropdownMenuItem dropdownMenuItem1=new DropdownMenuItem(
        child:new Text('男'),
        value: '男',
      );
      items.add(dropdownMenuItem1);
      DropdownMenuItem dropdownMenuItem2=new DropdownMenuItem(
        child:new Text('⼥'),
        value: '⼥',
      );
      items.add(dropdownMenuItem2);
      return items;
    }

    var yellow;
    return Column(
      children: [
        new MaterialButton(
          child: new Text('点击按钮'),
          onPressed: (){
            print('点击事件');
          }
        ),
        new RaisedButton(
            child: new Text('点击按钮'),
            onPressed: (){
              print('点击事件');
            }
        ),
        new FlatButton(
            child: new Text('点击按钮'),
            onPressed: (){
              print('点击事件');
            }
        ),
        DropdownButton(
          // items: getListData(),
          items: [
            new DropdownMenuItem( child:new Text('男'), value: '1'),
            new DropdownMenuItem( child:new Text('女'), value: '0')
          ],
          hint:new Text('下拉选择你的性别'),  // 当没有默认值的时候可以设置的提示
          value: value,  // 下拉菜单选择完之后显示给⽤户的值
          onChanged: (T){  // 下拉菜单item点击之后的回调
            setState(() {
              value=T;
            });
          },
          elevation: 24, // 设置阴影的⾼度
          style: new TextStyle( // 设置⽂本框⾥⾯⽂字的样式
            color: Colors.red
          ),
          iconSize: 50.0,//设置三⻆标icon的⼤⼩
        ),
        IconButton(
            icon: Icon(Icons.access_time),
            iconSize: 30,
            color: Colors.yellow,
            onPressed:(()=>{
              print('onPressed')
            })
        ),
      ]
    );
  }
}
