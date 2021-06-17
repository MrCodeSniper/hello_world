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
          decoration: BoxDecoration(color:Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: [
               Row(
                 children: [
                   ClipOval( //如果是正方形 会绘制成圆形 如果是长方形会绘制为椭圆
                     clipBehavior: Clip.antiAlias, //裁剪抗锯齿
                     child: SizedBox(
                       width: 100,
                       height: 100,
                       child: Image.network("https://www.devio.org/img/avatar.png"),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.all(10),
                     child: ClipRRect( //圆角矩形控件
                       borderRadius: BorderRadius.circular(10), //圆角插件
                       child: Opacity( //透明度插件
                         opacity: 0.5, //0f-1f
                         child: Image.network("https://www.devio.org/img/avatar.png",width: 100,height: 100,),
                       ),
                     ),
                   ),
                 ],
               ),
              Container(
                margin: EdgeInsets.all(10),//四角值插件
                height: 100,
                child: PhysicalModel( // 主要的功能就是设置widget四边圆角，可以设置阴影颜色，和z轴高度 与clipRadius的区别在于 一个是裁剪 一个是包裹
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias, //默认抗锯齿为null 无绘制效果
                  elevation: 6.0,
                  borderRadius: BorderRadius.circular(10),
                   child: PageView(children: [ ///类似viewpager
                     _getPageView("测试1", Colors.blue),
                     _getPageView("测试2", Colors.red),
                     _getPageView("测试3", Colors.green),
                   ],),),
                ),
              FractionallySizedBox( //size 宽高权重区域插件
                alignment: Alignment.center,
                widthFactor: 0.55, //在column上宽度因子才有用 类似weight
                child: Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text("文本内容",style: TextStyle(fontSize: 20),),
                ),
              ),
              Stack( //类似framelayout的插件 具有叠加效果
                children: [
                  Image.network("https://www.devio.org/img/avatar.png",width: 100,height: 100,),
                  Positioned( //在Stack中进行定位的插件
                    left: 0, //距离层叠组件的距离
                    bottom: 0,
                    child: Image.network("https://www.devio.org/img/avatar.png",width: 50,height: 50,),)
                ],
              ),
              Wrap(  //内容自动换行插件
                 spacing: 10, //水平间距
                 runSpacing: 10,//垂直间距
                 children: [
                   _getChip("你好"),
                   _getChip("测试"),
                   _getChip("啊啊啊"),
                   _getChip("完全"),
                   _getChip("加班"),
                   _getChip("我去")
                 ],
              )
            ],
          ),),
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


  _getChip(String title){
    return Chip(
        avatar: CircleAvatar(
          child: Text(title.substring(0,1)),
          backgroundColor: Colors.blue,
        ), //圆形图标插件
        label: Text(title));
  }


}