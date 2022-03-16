import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class SFCounterWidget extends InheritedWidget {
  final int counter;
  final funCounter;

  SFCounterWidget({required this.counter, required Widget child, this.funCounter}) : super(child:child);

  static SFCounterWidget? of(BuildContext ctx) {
    //沿着Element树 去找到最近的SFCounterWidgetElement，然后从element中取出widget对象
    return ctx.dependOnInheritedWidgetOfExactType();
  }

  //返回true：依赖当前SFCounterWidget的widget的state类 会执行didChangeDependencies()方法
  @override
  bool updateShouldNotify(SFCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 1000;

  void addCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter测试共享数据"),
      ),
      body: SFCounterWidget(
        counter: _counter,
        funCounter: addCounter,
        child: Column(
          children: [
            SFShowData01(),
            SFShowData02(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addCounter,
      ),
    );
  }
}

class SFShowData01 extends StatefulWidget {
  @override
  _SFShowData01State createState() => _SFShowData01State();
}

class _SFShowData01State extends State<SFShowData01> {
  @override
  Widget build(BuildContext context) {
    int? counter = SFCounterWidget.of(context)?.counter;
    return Card(
      color: Colors.red,
      child: GestureDetector(
        child: Text("当前计数: $counter"),
        onTap: SFCounterWidget.of(context)?.funCounter,
      )
      ,
    );
  }
}

class SFShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int? counter = SFCounterWidget.of(context)?.counter;
    return Card(
        color: Colors.green,
        child: Column(
          children: [
            Text("当前计数: $counter"),
            SFGrandChild()
          ],
        )
    );
  }
}

class SFGrandChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int? counter = SFCounterWidget.of(context)?.counter;
    return Text("深层级组件当前计数: $counter");
  }
}


