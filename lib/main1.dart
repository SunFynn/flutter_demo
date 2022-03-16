import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter/components_main1/Contanior.dart';
import 'package:my_first_flutter/components_main1/ImageText.dart';
import 'package:my_first_flutter/components_main1/ListViewTask.dart';
import 'package:my_first_flutter/components_main1/FriendList/friendList.dart';
import 'dart:io';

import 'components_main1//Button.dart';

// flutter课程1-2课内容，包括components文件夹中的控件 [Components文件夹中的FriendList文件夹是朋友列表项目]

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: '1231313123222123123----'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var getStr = null;
  var httpRes = null;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    httpFunction();
    httpClientFunction();
  }

  httpFunction() async{
    var url = Uri.parse('https://www.fastmock.site/mock/8f1dc753f3ae1b6778a07f66fa671172/request/user/test');
    var request = await http.get(url);
    var response = await request;
    setState(() {
      httpRes= '${response.statusCode} -- ${response.body} - ';
    });
  }

  httpClientFunction() async{
    var url = Uri.parse('https://www.fastmock.site/mock/8f1dc753f3ae1b6778a07f66fa671172/request/user/test');
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(url);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        result = json.toString();

      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    setState(() {
      getStr = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 垂直加载元素, 垂直加载元素超出高度，也不会产生滚动体，最后行元素会怪异展示
      // body: Contanior(),
      // body: const ListViewTask(),
      body: friendList(),
      // Column(
      //   children: [
      //     // 水平加载元素，Row超出并不会换行展示，最后超出的元素会怪异展示
      //     // 图片-text文本控件
      //     // ImageText(),
      //
      //     // http请求内容
      //     Column(
      //       children: <Widget>[
      //         Text(
      //           '${getStr} - ${httpRes}',
      //         ),
      //       ],
      //     ),
      //
      //     // 按钮控件
      //     // Button()
      //
      //     // 容器控件
      //     Contanior()
      //   ]
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
