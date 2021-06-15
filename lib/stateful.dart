import 'package:flutter/material.dart';

class StatefulApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return _StatefulGroupState();
  }
}


class _StatefulGroupState extends State<StatefulApp>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '使用flutter 无状态控件',
      theme: ThemeData( ///主题颜色
          primarySwatch: Colors.brown
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('使用flutter 无状态控件'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {  },
        child: Text("悬浮"),),
        bottomNavigationBar: BottomNavigationBar( ///底部导航栏 选中状态切换
            currentIndex: _currentIndex,
            onTap: (index){ ///匿名函数
              setState(() {
                 _currentIndex = index;
              });
            },
            selectedItemColor:Colors.cyanAccent,
            items:[
              BottomNavigationBarItem(
                  icon: Icon(Icons.school,color:Colors.grey),
                  activeIcon: Icon(Icons.school,color:Colors.cyanAccent),
                  label: "我的学堂"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility,color:Colors.grey),
                  activeIcon: Icon(Icons.accessibility,color:Colors.cyanAccent),
                  label: "个人中心",
              )
            ]
        ),
        body:
        _currentIndex==0? //通过下标区分页面控件
        // child: new Text('Hello World'),
        // child: new Text(wordPair.asPascalCase),
         RefreshIndicator(child: ListView( ///下拉刷新控件 -类似refreshlayout
           children: [
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
                 ),
                 Image.network("https://www.devio.org/img/avatar.png",width: 100,height: 100,),///加载网络图片
                 TextField( ///类似edittext
                  decoration: InputDecoration(icon: Icon(Icons.map),hintText: "请输入",contentPadding: EdgeInsets.all(5),
                  hintStyle: TextStyle(fontSize: 20)),
                 )
               ],),
             )
           ],
         ), onRefresh: _handleFresh):
        Container(
          height: 100,
          child: PageView(children: [ ///类似viewpager
            _getPageView("测试1", Colors.blue),
            _getPageView("测试2", Colors.red),
            _getPageView("测试3", Colors.green),
        ],),),
      ),
    );
  }


  _getPageView(String title,Color color){
    return Container( //返回背景颜色的居中文本
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20),),
    );
  }

  ///异步调用
  Future<Null> _handleFresh() async{
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }

}