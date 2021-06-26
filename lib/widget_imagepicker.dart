import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return _StatefulGroupState();
  }
}

class _StatefulGroupState extends State<ImagePickerWidget>{

  var _imgPath;

  @override
  Widget build(BuildContext context) {
    ///类似initview初始化视图 每次状态改变都会build 重绘制
    print("-------build-------");
    return new MaterialApp(
      title: '图片选择app',
      theme: ThemeData( ///主题颜色
          primarySwatch: Colors.brown,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: new Text('图片选择app'),
        ),
        body:Center(
          child: Container(
            child: Column(
              children: [
                RaisedButton(onPressed: _takePhoto,
                  child: Text("选择图片",style: TextStyle(fontSize: 20),),
                ),
                RaisedButton(
                  onPressed: _openGallery,
                  child: Text("选择照片"),
                ),
                _ImageView(_imgPath),
              ],
            ),
          ),
        )
      ),
    );
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

/*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

}