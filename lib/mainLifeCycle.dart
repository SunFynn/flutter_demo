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
        home: LifeCycleDemo()
    );
  }
}

class LifeCycleDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycleDemo> {
  var _count = 0;

  @override
  void initState() {
    super.initState();
    print('----------initState------------');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('----------didChangeDependencies------------');
  }

  @override
  Widget build(BuildContext context) {
    print('----------build------------');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('关闭页面'),
              onPressed: () => {Navigator.of(context).pop()},
            ),
            Text('当前计数器数量 : '+ _count.toString()),
            ElevatedButton(
              child: const Text('刷新界面'),
              onPressed: () => {
                setState(() {
                  _count++;
                  print('----------刷新界面------------');
                })
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('----------deactivate------------');
  }

  @override
  void dispose() {
    super.dispose();
    print('----------dispose------------');
  }

  @override
  void didUpdateWidget(LifeCycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('----------didUpdateWidget------------');
  }
}