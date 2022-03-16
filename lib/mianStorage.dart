
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';

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
            // body: homeBox(),
            // body: PathProviderBox(),
            body: StoragePage()
        )
    );
  }
}


// SharedPreferences数据存储
class homeBox extends StatefulWidget {
  const homeBox({Key? key}) : super(key: key);

  @override
  _homeBoxState createState() => _homeBoxState();
}

class _homeBoxState extends State<homeBox> {
  final _textFieldController = TextEditingController();
  var _storageString = '';
  final STORAGE_KEY = 'storage_key';

  /**
   * 利用SharedPreferences存储数据
   */
  Future saveString() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(_textFieldController.text.toString());
    sharedPreferences.setString(STORAGE_KEY, _textFieldController.text.toString());
  }

  /**
   * 获取存在SharedPreferences中的数据
   */
  Future getString() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _storageString = sharedPreferences.getString(STORAGE_KEY)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("shared_preferences存储", textAlign: TextAlign.center),
        TextField(
          controller: _textFieldController,
          keyboardType: TextInputType.text,
        ),
        MaterialButton(
          onPressed: saveString,
          child: new Text("存储"),
          color: Colors.pink,
        ),
        MaterialButton(
          onPressed: getString,
          child: new Text("获取"),
          color: Colors.lightGreen,
        ),
        Text('shared_preferences存储的值为  $_storageString'),
      ],
    );
  }
}

// PathProvider文件存储
class PathProviderBox extends StatefulWidget {
  const PathProviderBox({Key? key}) : super(key: key);

  @override
  _PathProviderBoxState createState() => _PathProviderBoxState();
}

class _PathProviderBoxState extends State<PathProviderBox> {
  final _textFieldController = TextEditingController();

  var _storageString = '';

  /**
   * 利用文件存储数据
   */
  saveString() async {
    final file = await getFile('file.text');
    //写入字符串
    file.writeAsString(_textFieldController.value.text.toString());
  }

  /**
   * 获取存在文件中的数据
   */
  getString() async {
    final file = await getFile('file.text');
    var filePath  = file.path;
    setState(() {
      file.readAsString().then((String value) {
        _storageString = value +'\n文件存储路径：'+filePath;
      });
    });
  }

  /**
   * 初始化文件路径
   */
  Future<File> getFile(String fileName) async {
    //获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
    final fileDirectory = await getApplicationDocumentsDirectory();

    //获取存储路径
    final filePath = fileDirectory.path;

    //或者file对象（操作文件记得导入import 'dart:io'）
    return new File('${filePath}/${fileName}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("文件存储", textAlign: TextAlign.center),
        TextField(
          controller: _textFieldController,
        ),
        MaterialButton(
          onPressed: saveString,
          child: new Text("存储"),
          color: Colors.cyan,
        ),
        MaterialButton(
          onPressed: getString,
          child: new Text("获取"),
          color: Colors.deepOrange,
        ),
        Text('从文件存储中获取的值为  $_storageString'),
      ],
    );
  }
}


// Sqflite数据库存储
class StoragePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StorageState();
}

class StorageState extends State {
  final _textFieldController = TextEditingController();
  var _storageString = '';

  /**
   * 利用Sqflite数据库存储数据
   */
  saveString() async {
    final db = await getDataBase('my_db.db');
    //写入字符串
    db.transaction((trx) async{
      trx.rawInsert(
          'INSERT INTO user(name) VALUES("${_textFieldController.value.text.toString()}")');
    });
  }

  /**
   * 获取存在Sqflite数据库中的数据
   */
  Future getString() async {
    final db = await getDataBase('my_db.db');
    var dbPath = db.path;
    setState(() {
      db.rawQuery('SELECT * FROM user').then((List<Map> lists) {
        print('----------------$lists');
        var listSize = lists.length;
        //获取数据库中的最后一条数据
        _storageString = lists[listSize - 1]['name'] +
            "\n现在数据库中一共有${listSize}条数据" +
            "\n数据库的存储路径为${dbPath}";
      });
    });
  }

  /**
   * 初始化数据库存储路径
   */
  Future<Database> getDataBase(String dbName) async {
    //获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
    final fileDirectory = await getApplicationDocumentsDirectory();

    //获取存储路径
    final dbPath = fileDirectory.path;

    //构建数据库对象
    Database database = await openDatabase(dbPath + "/" + dbName, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT)");
        });

    return database;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Sqflite数据库存储", textAlign: TextAlign.center),
        TextField(
          controller: _textFieldController,
        ),
        MaterialButton(
          onPressed: saveString,
          child: new Text("存储"),
          color: Colors.cyan,
        ),
        MaterialButton(
          onPressed: getString,
          child: new Text("获取"),
          color: Colors.deepOrange,
        ),
        Text('从Sqflite数据库中获取的值为  $_storageString'),
      ],
    );
  }
}