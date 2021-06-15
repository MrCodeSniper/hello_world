import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          // child: new Text('Hello World'),
          // child: new Text(wordPair.asPascalCase),

          child: new RandomWords(), //替换widget
        ),
      ),
    );
  }
}


class RandomWords extends StatefulWidget{

  /**
   * StatefulWidget需要重写方法 创建state
   */
  @override
  State<StatefulWidget> createState() {
     return new RandomWordsState();
  }

}

/**
 * 状态state 泛型指定statewidget
 */
class RandomWordsState extends State<RandomWords>{

  @override
  Widget build(BuildContext context) { //state维护可变的widget
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }

}