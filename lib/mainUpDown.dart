import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 下拉刷新 & 上拉加载
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{},
        home: HomePage()
    );
  }
}

// 下拉刷新
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State {
  List<ItemEntity> entityList = [];
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      entityList.add(ItemEntity("Item  $i", Icons.accessibility));
    }
    _scrollController.addListener(() {
      print(_scrollController.position.maxScrollExtent);
      print(_scrollController.position.pixels);

      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print("------------加载更多-------------");
        _getMoreData();
      }
    });
  }

  Future<Null> _handleRefresh() async {
    print('-------下拉刷新------------');
    await Future.delayed(Duration(seconds: 2), () {
      //模拟延时
      setState(() {
        // entityList.clear();
        entityList = [...List.generate(
            10,
                (index) => new ItemEntity("下拉刷新后--item $index", Icons.person)
        ), ...entityList];
        return null;
      });
    });
  }

  Future<Null> _getMoreData() async {
    print('-------上拉加载------------');
    await Future.delayed(Duration(seconds: 2), () { //模拟延时操作
      setState(() {
        List<ItemEntity> newList = List.generate(5, (index) =>
        new ItemEntity("上拉加载--item ${index + entityList.length}", Icons.animation));
        entityList.addAll(newList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("ListView"),
        ),
        body: RefreshIndicator(
            displacement: 50,
            color: Colors.redAccent,
            backgroundColor: Colors.blue,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if(index == entityList.length){
                  return LoadMoreView();
                }else {
                  return ItemView(itemEntity: entityList[index]);
                }
              },
              itemCount: entityList.length + 1,
              controller: _scrollController,
            ),
            onRefresh: _handleRefresh
        )
    );
  }
}

class LoadMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Row(children: const <Widget>[
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.all(10)),
          Text('加载中...')
        ], mainAxisAlignment: MainAxisAlignment.center,),
      ),
    ), color: Colors.white70,);
  }

}

/**
 * 渲染Item的实体类
 */
class ItemEntity {
  String title;
  IconData iconData;

  ItemEntity(this.title, this.iconData);
}

/**
 * ListView builder生成的Item布局，读者可类比成原生Android的Adapter的角色
 */
class ItemView extends StatelessWidget {
  const ItemView({Key? key, required this.itemEntity}) : super(key: key);
  final ItemEntity itemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(
              itemEntity.title,
              style: TextStyle(color: Colors.black87),
            ),
            Positioned(
                child: Icon(
                  itemEntity.iconData,
                  size: 30,
                  color: Colors.blue,
                ),
                left: 5
            )
          ],
        ));
  }
}
