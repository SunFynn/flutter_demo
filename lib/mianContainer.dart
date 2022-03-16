
import 'package:flutter/material.dart';
import 'package:my_first_flutter/components_main1/Contanior.dart';

void main() {
  runApp(const MyApp());
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
        home: Scaffold(
          appBar: new AppBar(
              title: Text('123123')
          ),
          // body: const ExpendedTest(),
          // body: FlexTest(),
          // body: StackBox()
          // body: WrapBox(),
          // body: TabBox(),
          // body: TextFieldBox(),
          // body: ButtonBox(),
          // body: ALLBOX()
          body: ProgressBox(),
        )
    );
  }
}

class ProgressBox extends StatelessWidget {
  const ProgressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.0),
        Text("设置进度比为80%(0.8)"),
        SizedBox(height: 30.0),
        LinearProgressIndicator(
          value: 0.8, //
          backgroundColor: Colors.white,
        ),
        SizedBox(height: 30.0), //设置间隔
        Text("未做任何处理，默认一直循环"),
        LinearProgressIndicator(),
        Text("设置圆环进度颜色为红色"),
        LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
        ),
        new Slider(
          value: 0.4,
          onChanged: null,
        ),
      ],
    );
  }
}


class ALLBOX extends StatelessWidget {
  const ALLBOX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tooltip(
            message: "显示提示内容",  // 提示的内容
            height: 60.0,  // Tooltip的高度
            verticalOffset: 50.0,  // 具体内部child Widget竖直方向的距离,
            preferBelow: false, // 是否显示在下面
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0), // padding
            child: Container(
              margin: EdgeInsets.all(100),
              child: const Icon(
                Icons.android,
                size: 50.0,
                color: Colors.green,
              ),
            )
        ),
        Builder(builder: (BuildContext context) {
          return new RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("SanckBar is Showing "),
                action: new SnackBarAction(
                    label: "撤销",
                    onPressed: () {
                      print("点击撤回---------------");
                    }),
              ));
            },
            child: new Text("SnackBar提示"),
            color: Colors.cyan,
            highlightColor: Colors.lightBlueAccent,
            disabledColor: Colors.lightBlueAccent,
          );
        }),
        ElevatedButton(
          child: const Text('出现弹框'),
          onPressed: (){
            showDialog(
                context: context,
                builder: (ctx) {
                  return SimpleDialog(
                    title: Text("标题"),
                    titlePadding: EdgeInsets.all(10),
                    backgroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                    children: <Widget>[
                      Text("文字内容1"),
                      ListTile(
                        leading: new Icon(Icons.android),
                        title: new Text("android"),
                      ),
                      Text("文字内容2"),
                      Text("文字内容3"),
                      Text("文字内容4"),
                    ],
                  );
                });
          },
        ),
        ElevatedButton(
          child: Text('出现弹框'),
          onPressed: (){
            showDialog(
              context: context,
              builder: (ctx) {
                return new AlertDialog(
                  title: new Text("标题"),
                  content: new Text("内容区域"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context);
                        },
                        child: new Text("确定")),
                    new FlatButton(
                        onPressed: () {
                          print("点击取消------");
                        },
                        child: new Text("取消")),
                  ],
                );
              },
            );
          },
        ),
        RaisedButton(
          child: new Text("BottomSheet"),
          onPressed: () {
            showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return new Container(
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: new Icon(Icons.chat),
                            title: new Text("对话框列表1"),
                          ),
                          new ListTile(
                            leading: new Icon(Icons.help),
                            title: new Text("对话框列表2"),
                          ),
                          new ListTile(
                            leading: new Icon(Icons.settings),
                            title: new Text("对话框列表3"),
                          ),
                          new ListTile(
                            leading: new Icon(Icons.more),
                            title: new Text("对话框列表4"),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        )
      ],
    );
  }
}


class ButtonBox extends StatelessWidget {
  const ButtonBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: (){},
          child: const Text('OutlinedButton按钮'),
          style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith((states) => null)
          ),
        )
      ],
    );
  }
}


// TextField文本框组件
class TextFieldBox extends StatefulWidget {
  const TextFieldBox({Key? key}) : super(key: key);

  @override
  _TextFieldBoxState createState() => _TextFieldBoxState();
}

class _TextFieldBoxState extends State<TextFieldBox> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  /**
   * 清空输入框内容
   */
  void onTextClear() {
    setState(() {
      _username.clear();
      _password.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              const Text('登录控件'),
              TextField(
                controller: _username,
                keyboardType: TextInputType.text,     // 文本框类型
                decoration: InputDecoration(
                  icon: const Icon(Icons.supervised_user_circle),
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  prefixIcon: const Icon(Icons.find_in_page),
                  border: OutlineInputBorder(  //添加边框
                    gapPadding: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onSubmitted: (value){
                  print("------------文字提交触发（键盘按键）--");
                },
                onEditingComplete: (){
                  print("----------------编辑完成---");
                },
                onChanged: (value){
                  print("----------------输入框中内容为:$value--");
                },
              ),
              TextField(
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: '密码',
                      icon: const Icon(Icons.password_sharp),
                      prefixIcon: const Icon(Icons.password),
                      border: OutlineInputBorder(
                          gapPadding: 10,
                          borderRadius: BorderRadius.circular(20)
                      )
                  )
              ),
              Builder(builder: (BuildContext context) {
                return new RaisedButton(
                  onPressed: () {
                    if (_username.text.toString() == "admin" && _password.text.toString() == "123456") {
                      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("登录成功")));
                    } else {
                      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("用户名密码有误，请重新输入")));
                      onTextClear(); // 情况输入内容，让用户重新输入
                    }
                  },
                  color: Colors.blue,
                  highlightColor: Colors.deepPurple,
                  disabledColor: Colors.cyan,
                  child: new Text(
                    "登录",
                    style: new TextStyle(color: Colors.white),
                  ),
                );
              })
            ],
          )
      ),
    );
  }
}


// Tab组件
class TabBox extends StatelessWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,  // tab数量
        initialIndex: 1,  //默认选中的index
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: const TabBar(
                  labelColor: Colors.blue,   // 被选中tab的问题颜色
                  unselectedLabelColor: Colors.lime,  // 未选中tab的文字颜色
                  labelStyle: TextStyle(fontSize: 14),   // 文字的样式
                  indicatorColor: Colors.black,   // tab框下方线的颜色
                  indicatorWeight: 1,   // tab框下方的线
                  indicatorSize: TabBarIndicatorSize.label,    // tab框下方线的长度, 枚举类型 TabBarIndicatorSize.label和文字长度一致， TabBarIndicatorSize.tab tab框的长度
                  tabs: [
                    Tab(text: 'tab1'),
                    Tab(text: 'tab2'),
                    Tab(text: 'tab3')
                  ]
              ),
            ),
            const Expanded(
                flex: 1,
                child: TabBarView(
                    children: [
                      Center(child: Text('tab1 content'),),
                      Center(child: Text('tab2 content'),),
                      Center(child: Text('tab3 content'),),
                    ]
                )
            )
          ],
        )
    );
  }
}


// Wrap自动换行容器
class WrapBox extends StatelessWidget {
  const WrapBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CBox(color: Colors.red,),
        CBox(color: Colors.red,),
        CBox(color: Colors.red,),
        CBox(color: Colors.red,),
        CBox(color: Colors.red,),
        CBox(color: Colors.red,),
        CBox(color: Colors.red,),
      ],
    );
  }
}

// Stack堆叠容器
class StackBox extends StatelessWidget {
  const StackBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: 1,
      children: [
        Container(
            width: 300,
            height: 300,
            color: Colors.red
        ),
        Positioned(
            left: 50,
            top: 50,
            child: Container(
              color: Colors.red,
              child: Icon(Icons.favorite, size: 50, color: Colors.white),
            )
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Text("Hello wold", style: TextStyle(fontSize: 20, color: Colors.white)),
        )
      ],
    );
  }
}

// Flex布局容器
class FlexTest extends StatelessWidget {
  const FlexTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,   // direction方向，枚举类型  Axis.horizontal水平方向、 Axis.vertical垂直方向
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // direction: Axis.vertical,
      children: const [
        CBox(color: Colors.red),
        CBox(color: Colors.yellow),
        CBox(color: Colors.blue),
      ],
    );
  }
}

class CBox extends StatelessWidget {
  const CBox({Key? key, required this.color}) : super(key: key);
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: this.color,
      child: Text('Container容器'),
    );
  }
}

// Expended填充容器
class ExpendedTest extends StatelessWidget {
  const ExpendedTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: const Text('Container容器'),
        ),
        Expanded(
            child: Container(
              height: 100,
              width: 60,
              color: Colors.yellow,
              child: const Text('Expended容器'),
            )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: const Text('Container容器1'),
          ),
        )
      ],
    );
  }
}



