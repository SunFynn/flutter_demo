import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'components_main2/home.dart';

// flutter课程3课内容，app结构及路由 【components_main2文件夹中是结构型页面，示例2】

// void main() {
//   runApp(const MyApp());
// }

// 全局主题颜色
final ThemeData IOSTheme = ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.orange
);

final ThemeData AndroidTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
    accentColor: Colors.orange
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTargetPlatform == TargetPlatform.iOS ? IOSTheme : AndroidTheme,
      // routes: <String, WidgetBuilder> {
      //   '/first': (BuildContext context) => FirstPage(),
      //   '/second': (BuildContext context) => SecondPage(),
      // },
      // initialRoute: '/second',
      home: HomeScreen(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;
  final List<Widget> _children= [
    FirstPageContent('银行'),
    FirstPageContent('联系人'),
    FirstPageContent('音乐'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页头部'),
        // 头部左侧内容
        // leading: const Icon(Icons.arrow_left),
        actions: [
          Text('右侧1'),
          Text('右侧2'),
          Text('右侧3')
        ],
        // 头部title是否居中
        centerTitle: false,
      ),
      body: Container(
        child: Center(
            child: _children[_currentIndex]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int selectIndex){
          setState(() {
            _currentIndex = selectIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              title: Text('银行')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text('联系人')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text('音乐')
          )
        ],
      ),
      drawer: const Drawer(
        child: Center(
          child: Text('侧边栏信息'),
        ),
      ),
    );
  }
}

class FirstPageContent extends StatelessWidget {
  final String text;
  FirstPageContent(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}



class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      // data: new ThemeData(
      //   primaryColor: Colors.deepPurple,
      //   primarySwatch: Colors.deepPurple
      // ),
      data: Theme.of(context).copyWith(primaryColor: Colors.orange),
      child: Scaffold(
        appBar: AppBar(title: Text('详情页头部')),
        body: Center(
            child: Text('Second Page', style: TextStyle(color: Theme.of(context).primaryColor))
        ),
      ),
    );
  }
}

