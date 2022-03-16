import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/components_main2/find/findScreen.dart';
import 'package:my_first_flutter/components_main2/identify/identifyScreen.dart';
import 'package:my_first_flutter/components_main2/mine/mineScreen.dart';
import 'package:my_first_flutter/components_main2/near/nearScraan.dart';
import 'package:my_first_flutter/components_main2/trend/trendScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _chilrdren = [
    trendScreen(),
    nearScreen(),
    identifyScreen(),
    findScreen(),
    mineScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _chilrdren[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.shifting,   // type控制下方标题是否存在： fixed,一直存在；  shifting，仅当前的点击状态的tiem存在标题
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.filter),
              title: Text('动态')
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('附近')
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.indeterminate_check_box),
              title: Text('识花')
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page),
              title: Text('发现')
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我的')
          )
        ]
      ),
    );
  }
}
