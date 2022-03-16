import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewTask extends StatefulWidget {
  const ListViewTask({Key? key}) : super(key: key);

  @override
  _ListViewTaskState createState() => _ListViewTaskState();
}

// 定义listView数据得类型
class ListObj {
  String imgurl;
  String ren;

  ListObj(this.imgurl, this.ren);
}

class _ListViewTaskState extends State<ListViewTask> {
  @override

  // 生成ListView的数据
  final List<ListObj> items = List.generate(50, (index) => new ListObj('assets/images/1.jpeg', 'listViewItem $index'));

  // 字符串数组
  final List<String> items1 = List.generate(50, (index) => 'listViewItem $index');


  Widget build(BuildContext context) {
    return getListView();
  }

  // 方法3：ListView.separated()
  getListView(){
    return new ListView.separated(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return Row(
          children: [
            new Image.asset(item.imgurl, width: 100, height: 100),
            new Text('${item.ren}')
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.red);
      },
    );
  }
}