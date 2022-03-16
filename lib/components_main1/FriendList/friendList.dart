import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/components_main1//FriendList/friend.dart';

class friendList extends StatefulWidget {
  const friendList({Key? key}) : super(key: key);

  @override
  _friendListState createState() => _friendListState();
}

class _friendListState extends State<friendList> {
  List<Friend> _friends = [];
  var loading = true;

  // 进入页面，初始化调用方法
  @override
  void initState() {
    getListData();
  }

  getListData() async{
    var result;
    var url = Uri.parse('https://randomuser.me/api/?results=30');
    HttpClient httpClient = new HttpClient();
    try {
      HttpClientRequest request = await httpClient.getUrl(url);
      HttpClientResponse response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        // result = json.toString();
        setState(() {
          _friends =  Friend.resolveDataFromReponse(json);
          loading = false;
        });
      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? _loading() : getListView();
  }

  getListView(){
    return ListView.separated(
      itemCount: _friends.length,
      itemBuilder: _buildList,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.red);
      },
    );
  }

  Widget _loading(){
    return Center(child: new CircularProgressIndicator());
  }

  Widget _buildList(BuildContext context, int index){
    var friend = _friends[index];

    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(friend.avatar),),
      title: Text(friend.name),
      subtitle: Text(friend.email),
      trailing: Icon(Icons.arrow_right),
    );
  }
}
