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
import 'package:url_launcher/url_launcher.dart';

class OutSideRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '外部跳转界面',
      theme: ThemeData( ///主题颜色
        primarySwatch: Colors.brown,
        fontFamily: 'Mogov' ///默认全体生效
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('外部跳转界面'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body:
          new Container(
            child: Column(children: [
              RaisedButton(
                onPressed: ()=> _launchURL("https://mrcodesniper.github.io/"), ///匿名函数
                child: Text("浏览器跳转URL"),
              ),
              RaisedButton(
                onPressed: ()=> _launchMap("geo:52.34,4.917"), ///匿名函数
                child: Text("使用地图应用打开"),
              )
            ],),
          ),
        ),
      );
  }

  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

  void _launchMap(String _scheme) async{
    if(await canLaunch((_scheme))){
      launch(_scheme);
    }else{
      throw 'Could not launch $_scheme';
    }
  }

}