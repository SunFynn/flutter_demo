//***
//   dart语法比较严格，语句的末尾需要加上; 不然会错误提示
// */

// 引入flutter、material-ui库
import 'package:flutter/material.dart';
import 'package:my_first_flutter/components_main3/detail.dart';

// 主函数（入口函数），支持箭头函数语法 void main()=>{ runApp(const MyApp) };
void main() {
  runApp(const MyApp());
}

// 声明MyApp类
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  //重写build方法
  @override
  Widget build(BuildContext context){
    //返回一个Material风格的组件
    return MaterialApp(
      title:'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class ListTab {
  String text;
  var icon;
  ListTab(this.text, this.icon);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {

  final List<ListTab> topTabLists = [ListTab('tab1', Icons.ac_unit), ListTab('tab2', Icons.person), ListTab('tab3', Icons.find_in_page)];
  // 页面初始化时实例化 TabController
  late TabController _controller;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: topTabLists.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
          elevation: 0,
          title: Text('首页'),
          centerTitle: true,
          // leading: const Icon(Icons.print),
          // actions: <Widget>[
          //   IconButton(icon: Icon(Icons.message), onPressed: () {}),
          //   IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
          //   PopupMenuButton(
          //       onSelected: (String value) {
          //         print('-----------------$value');
          //       },
          //       itemBuilder: (BuildContext context) => [
          //         new PopupMenuItem(value: "选项一的内容", child: new Text("选项一")),
          //         new PopupMenuItem(value: "选项二的内容", child: new Text("选项二")),
          //         new PopupMenuItem(value: "选项三的内容", child: new Text("选项三")),
          //       ])
          // ],
          bottom: TabBar(
            controller: _controller,
            tabs: topTabLists
                .map((element) => Tab(
              text: element.text,
              icon: Icon(element.icon),
            ))
                .toList(),
            onTap: (index) => {},
          )
      ),
      drawer: Drawer(
        child: Text('左侧抽屉'),
      ),
      endDrawer: Drawer(
        child: Text('右侧抽屉'),
      ),
      body: Center(
        child: TabBarView(
          controller: _controller,
          children: [const Text('tab1内容'), const Text('tab2内容'), const Text('tab3内容')],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     print("---------");
      //   },
      //   child: Icon(Icons.add),
      // ),
      //与FloatingActionButton配合实现"打洞"效果
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            Tab(text: "首页", icon: Icon(Icons.home)),
            Tab(text: "消息", icon: Icon(Icons.message)),
            Tab(text: "动态", icon: Icon(Icons.add_a_photo)),
            Tab(text: "我的", icon: Icon(Icons.person)),

          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked, //设置FloatingActionButton的位置

    );
  }
}