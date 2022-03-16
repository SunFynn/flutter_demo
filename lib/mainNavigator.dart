import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_flutter/components_main3/detail.dart';

void main() {
  runApp(const MyApp());
}

// flutter路由

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          '/first_page': (BuildContext context) => FirstPage(),
          '/second_page': (BuildContext context) => SecondPage(),
          '/DetailPage': (BuildContext context) => DetailPage(props: {"a":1, "b":2},)   // 静态路由初始化路由参数信息
        },
        home: WelcomePage()
    );
  }
}

// 欢迎页，刚进入app弹出一个欢迎或广告页，倒计时自动跳转到首页
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = new Timer(Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return AllHomePage();
          }),
              (route) => false
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('广告页，三秒后跳转到首页'),
      ),
    );
  }
}


// 简单示例（动态路由）
class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DetailWidget();
            }),
          );
        },
        child: Text('跳转到详情页'),
      ),
    );
  }
}


// 路由跳转实例：静态路由跳转、动态路由跳转、动画自定义路由跳转
class AllHomePage extends StatefulWidget {
  const AllHomePage({Key? key}) : super(key: key);

  @override
  _AllHomePageState createState() => _AllHomePageState();
}

class _AllHomePageState extends State<AllHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/DetailPage').then((value){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return new AlertDialog(
                        content: new Text(value.toString()),
                      );
                    }
                );
              });
            },
            child: Text('静态路由跳转'),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(props: {"a": '动态参数跳转', "b":true});
              }));
            },
            child: Text('动态路由跳转'),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder:(BuildContext context,Animation animation,Animation secondaryAnimation){
                    return DetailPage(props: {"a": '动画自定义参数跳转', "b":true});
                  },
                  transitionsBuilder: (BuildContext, Animation<double> animation, _ , Widget){
                    return new FadeTransition(
                      opacity: animation,
                      child: new SlideTransition(
                          position: new Tween(
                            begin: const Offset(0,1.0),
                            end: Offset.zero
                          ).animate(animation),
                          // child: child,
                      ),
                    );
                  }
                )
              );
            },
            child: Text('动画自定义路由跳转'),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  // 2. 注册这个参数名称到当前类实例
  const DetailPage({Key? key, this.props}) : super(key: key);
  final props;   // 1. 定义一个接受参数的名称

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('详情页'),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('跳转到首页，并附带返回值的信息'),
        ),
        // child: Text('接受的参数信息: ${widget.props}'),   // 使用这个参数，widget.参数名
      ),
    );
  }
}



// 静态路由
// 第一页
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/second_page');
      },
      child: Text('跳转到第二页'),
    );
  }
}

// 第二页
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('第二页'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: new Text("返回"),
      ),
    );
  }
}