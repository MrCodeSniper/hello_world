import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/stateful.dart';
import 'package:hello_world/stateless.dart';

import 'gesture.dart';

void main() => runApp(new MyApp());

/**
 * StatelessWidget 属性不能改变 - 所有的值都是最终的.
 * MaterialApp 是一种标准的移动端和web端的视觉设计语言 一种样式 materialdesign
 * Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性
 * AppBar 标题栏
 * Text 类型 textview
 * child为子view
 * widget控件  在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)
 * Stateful widgets 持有的状态可能在widget生命周期中发生变化
 */
class MyApp extends StatelessApp {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title:Text( "路由管理"),
        ),
        body: NavigatorWidget(),
      ),
      routes: {
        /// 注册路由表 key和插件
        /// typedef WidgetBuilder = Widget Function(BuildContext context);
        /// widgetbuilder 其实是一个函数 返回widget 参数是BuildContext
        "stateless": (BuildContext context) => StatelessApp(),
        "stateful": (BuildContext context) => StatefulApp(),
        "gesture": (BuildContext context) => GestureAppWidget(),
      },
    );
  }
}


///总路由插件
class NavigatorWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return  MyNavigatorState();
  }
}

class MyNavigatorState extends State<NavigatorWidget> {
  var byName = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          SwitchListTile( //开关按钮 包含title
              title: Text("${byName?'':'不'}通过名字路由"),
              value: byName, onChanged: (value){ ///状态切换
            setState(() {
              this.byName = value;
            });
          }),
          _getBtn("无状态", StatelessApp(), "stateless"),
          _getBtn("有状态", StatefulApp(), "stateful"),
          _getBtn("手势监听", GestureAppWidget(), "gesture"),
        ],
      ),
    );
  }

  _getBtn(String title, page, String routeKey) {
    return Container(
      child: RaisedButton(

        ///按钮控件
        onPressed: () {
          if (byName) {
            ///通过路由的key去跳转
            Navigator.pushNamed(context, routeKey);
          } else {
            ///通过传入要路由的widget创建page跳转
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}


class RandomWords extends StatefulWidget {
  ///StatefulWidget需要重写方法 创建state
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

///状态state 泛型指定statewidget
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    ///state维护可变的widget
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}
