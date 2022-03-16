import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/components_main2/trend/secondScreen/Screen/articleScreen.dart';
import 'package:my_first_flutter/components_main2/trend/secondScreen/Screen/idScreen.dart';
import 'package:my_first_flutter/components_main2/trend/secondScreen/Screen/noteScreen.dart';

class trendScreen extends StatelessWidget {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text("动态"),
          title: _getSearchBar(),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.grey,
              iconSize: 28,
              onPressed: () {  },
            )
          ],
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: const Material(
                    color: Colors.white,
                    child: TabBar(
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        indicatorWeight: 1,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(fontSize: 14),
                        tabs: [
                          Tab(text: '花记'),
                          Tab(text: '鉴定'),
                          Tab(text: '文章')
                        ]
                    ),
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: TabBarView(
                        children: [
                          NoteScreen(),
                          IDScreen(),
                          ArticleScreen()
                        ]
                    )
                )
              ],
            )
        )
    );
  }

  Widget _getSearchBar() {
    return Container(
      height: 48,
      //设置边框 BoxDecoration
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey, width: 3)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 生成指定长度的缝隙 SizedBox
          const SizedBox(width: 5),
          const Icon(Icons.search, color: Colors.grey),
          Expanded(
              // 输入框 TextField
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top:-10),
                    hintText: '搜索花记/百科/鉴定/文章',
                    border: InputBorder.none
                ),
              )
          ),
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed: (){
                // 清空输入框中的内容
                _controller.clear();
              }
          )
        ],
      ),
    );
  }

}