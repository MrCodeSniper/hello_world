/// 无状态组件
///  1.Container
///  2.Text
///  3.Icon
///  4.CloseButton
///  5.BackButton
///  6.Chip
///  7.Divider
///  8.Card
///  8.AlertDialog

import 'package:flutter/material.dart';

class StatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _currentIndex = 0;
    return new MaterialApp(
      title: '使用flutter 无状态控件',
      theme: ThemeData( ///主题颜色
        primarySwatch: Colors.brown,
        fontFamily: 'Mogov' ///默认全体生效
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('使用flutter 无状态控件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar( ///底部导航栏
          currentIndex: _currentIndex,
          onTap: (index){ ///匿名函数

          },
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.school,color:Colors.grey),
              activeIcon: Icon(Icons.school,color:Colors.cyanAccent),
              title: Text("我的学堂")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility,color:Colors.grey),
              activeIcon: Icon(Icons.accessibility,color:Colors.cyanAccent),
              title: Text("个人中心")
            )
          ]
        ),
        body:
          // child: new Text('Hello World'),
          // child: new Text(wordPair.asPascalCase),
          new Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(10))), ///结构类型
            child: Column(children: [
              Text("第一个内容",style: TextStyle(color: Colors.amber,fontSize: 20)),
              Icon(Icons.access_alarm,color:Colors.amberAccent,size: 20,),
              CloseButton(color: Colors.black12,),
              BackButton(color:Colors.brown),
              Chip(
                  label: Text("测试气泡"),
                  avatar: CircleAvatar(
                    child: Container(
                      child: Text("123"),
                    ),
                  ),
              ), /// chip气泡
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("卡片内容"),
                )
              ),
              Divider(
                height: 1,
                color: Colors.black,
              ),
              AlertDialog(
                title: Text( "弹窗标题"),
                content:  Text( "弹窗内容"),
              )
            ],),
          ),
        ),
      );
  }

}