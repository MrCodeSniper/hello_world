import 'dart:ui';

import 'package:flutter/material.dart';

/**
 *  createState=>initState=>didChangeDependencies=>build=>deactivate=>dispose
 *  didUpdateWidget特殊情况触发
 *
 */
class LifecycleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("-------createState-------");
    ///类似构造函数创建activity(反射)
     return _StatefulGroupState();
  }
}

class _StatefulGroupState extends State<LifecycleWidget> with WidgetsBindingObserver{ ///生命周期
  int _currentCount = 0;

  Brightness? _brightness = Brightness.light;

  @override
  void initState() {
    ///类似oncreate 初始化阶段
    print("-------initState-------");
    WidgetsBinding.instance?.addObserver(this); ///添加APP生命周期监听
    super.initState();
  }

  /// 应用进入后台 先切换inactive 再切换 paused 返回前台为resumed
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("-------APP STATE: $state-------");
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    print("-------didChangeDependencies-------");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifecycleWidget oldWidget) {
    ///当插件的属性发生变化时会调用
    print("-------didUpdateWidget-------");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    ///类似deattach 插件解除界面绑定关系
    print("-------deactivate-------");
    super.deactivate();
  }

  @override
  void dispose() {
    ///类似onDestroy 插件销毁 常用来回收资源 关闭连接 最后触发
    print("-------dispose-------");
    WidgetsBinding.instance?.removeObserver(this); ///回收APP生命周期监听
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///类似initview初始化视图 每次状态改变都会build 重绘制
    print("-------build-------");
    return new MaterialApp(
      title: '插件的生命周期',
      theme: ThemeData( ///主题颜色
          primarySwatch: Colors.brown,
          brightness: _brightness
      ),
      home: new Scaffold(
        appBar: new AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: new Text('插件的生命周期'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {  },
        child: Text("悬浮"),),
        body:Center(
          child: Container(
            child: Column(
              children: [
                RaisedButton(onPressed: ()=>_onChangeTheme(),
                  child: Text("切换主题",style: TextStyle(fontSize: 20),),
                ),
                RaisedButton(onPressed: ()=>_onClick(),
                  child: Text("点击我",style: TextStyle(fontSize: 20),),
                ),
                Text("当前点击:$_currentCount")
              ],
            ),
          ),
        )
      ),
    );
  }

  _onClick(){
    setState(() {
      _currentCount+=1;
    });
  }
  _onChangeTheme(){
    setState(() {
       if(_brightness == Brightness.light){
         _brightness = Brightness.dark;
       }else{
         _brightness = Brightness.light;
       }
    });
  }


}