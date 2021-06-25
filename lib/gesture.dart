import 'package:flutter/material.dart';

class GestureAppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureState();
  }
}

class _GestureState extends State<GestureAppWidget> {

  String _touchMessage = "";

  //二维坐标
  double _movedX = 0;

  double _movedY = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '监听手势',
        theme: ThemeData(primarySwatch: Colors.brown),
        home: new Scaffold(
          appBar: new AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            title: new Text('使用flutter 无状态控件'),
          ),
          body: FractionallySizedBox( ///权重空间
            widthFactor: 1,
            child: Stack( //自动换行
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: ()=>{ recordTouchMessage("单击")}, ///单机
                      onDoubleTap: ()=>{ recordTouchMessage("双击") }, ///双击
                      onLongPress: ()=>{ recordTouchMessage("长按") }, ///长按
                      onTapCancel: ()=>{ recordTouchMessage("取消") }, ///取消
                      onTapUp: (detail)=>{ recordTouchMessage("抬起") }, ///抬起
                      onTapDown: (detail)=>{ recordTouchMessage("放下") }, ///放下
                      child: Container(
                        padding: EdgeInsets.all(60),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Text("触摸区域",style: TextStyle(color: Colors.white,fontSize: 36),),
                      ),
                    ),
                    Text(_touchMessage),
                    Positioned(
                      left: _movedX,
                      top: _movedY,
                      child: GestureDetector(
                        onPanUpdate: (e)=>_doMove(e),
                        child: Container(
                          width: 72,
                          height: 72,
                          //圆弧为长宽的一半 为圆
                          decoration: BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
    );
  }


  void recordTouchMessage(String msg){
    setState(() {
      _touchMessage += msg + "     ";
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      this._movedX += e.delta.dx;
      this._movedY += e.delta.dy;
    });
  }
}
