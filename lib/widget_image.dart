import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    _getLocalFile();
     return new ImagePageState();
  }
}

const double viewRate = 0.663306; //视图宽高比
const double imgRate = 1.234411;//图片宽高比
var width =300.0;
double height = width/viewRate;

var textWanted= Text('WANTED',
  style: TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing:width/30,
      fontSize: width/6),
);

var name =Text('NA MI',
  style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: width/9),
);

var price= Text('16,000,000',
  style: TextStyle(
      letterSpacing:width/45,
      fontWeight: FontWeight.bold,
      fontSize: width/10),
);
var img =Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black,width: width/100),
  ),
  width: width,
  height: width/imgRate,
  child: Image.asset('images/logo.png',fit: BoxFit.cover,),
);

var bottom =Stack(
  children: <Widget>[
    Image.asset('images/bottom.jpg',fit: BoxFit.fitWidth,),
    Container(child: name,alignment: Alignment.topCenter,padding: EdgeInsets.only(top: 6*width/100),),
    Container(child: price,alignment: Alignment.topCenter,padding: EdgeInsets.only(top: 17*width/100),)
  ],);
var wanted = Container(
  width: width,
  height: height,
  color: Color(0xffded0b5),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[textWanted,Padding(padding:
    EdgeInsets.fromLTRB(5*width/100,0,5*width/100,5*width/100),child: img,),
      bottom
    ],),
);
var result=Card(child:wanted ,elevation: 5*width/100,);//最终组件

///  class _ImageState extends State<Image> with WidgetsBindingObserver {
///  Image具备状态 图片有加载进度 各种状态
///  ImageStream? _imageStream;
///  ImageInfo? _imageInfo;
///  bool _isListeningToStream = false;
///  late bool _invertColors;
///
///
class ImagePageState extends State<ImageWidget>{


  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: "Flutter 图片的使用",
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            title: new Text('Flutter 图片的使用'),
          ),
          body: Container(
            child: Column(
              children: [
                Image(
                  image:  ResizeImage.resizeIfNeeded( /// ImageProvider图片提供器
                    50,
                      50,
                    AssetImage("images/logo.png")
                  ), ///自实现ImageProvider
                  semanticLabel: "语义标签 (无障碍服务使用?)",
                  width: 100,
                  height: 100,
                  colorBlendMode: BlendMode.dst, ///着色模式
                  /// BlendMode.src 只保留颜色层
                  /// BlendMode.clear 清除所有图层
                  /// BlendMode.dst 只保留图像层
                  /// BlendMode.srcOver 颜色层盖在图片层上
                  /// BlendMode.dstOver 图片层盖在颜色层上
                  /// BlendMode.color 覆盖图片着色区域
                  /// 等
                  color: Colors.blue,
                  fit: BoxFit.fill, ///填充模式 类似android的scaleType
                  ///BoxFit.fill 充满 BoxFit.contain拉伸到宽高的一边跟容器相同为止
                  ///BoxFit.none 不缩放
                  ///BoxFit.fitwidth和fitheight 缩放宽或高直到填满容器
                  ///BoxFit.cover 等比缩放 超出裁剪
                  filterQuality: FilterQuality.high, ///缩放质量
                  ///使用FilterQuality.low在缩放图片时使用二次线性插值算法
                  ///FilterQuality.none 在缩放图片时使用临近算法
                  ///FilterQuality.high 是最好的，也是最慢的，通常是三次插值或更好
                  ///FilterQuality.medium 的速度介于low和hight之间，通常是二次线性插值和锥体参数预滤波(mipmaps)的结合。
                ),
                Image.asset("images/logo.png",width: 100,height: 100,),
                Image.asset("images/ok.png",width: 50,height: 50,color: Colors.green,), /// 可以渲染图片边界
               // Image.network("https://img.alicdn.com/tfs/TB1Ly5oS3HqK1RjSZFPXXcwapXa-238-54.png",width: 100,height: 100,),
                Container( /// container容器与图片控件配合使用
                  /// 1.当容器大小大于图片 图片会完整展示 2.图片大于容器会自适应充满容器 而忽视原来容器大小
                  color: Colors.lightBlueAccent,
                  width: 0,
                  height: 0,
                  child:  Image.asset("images/logo.png",width: 100,height: 100,), /// Image也是图片的容器
                ),
                result
              ],
            ),
          ),
        ),
     );
  }

}

_getLocalFile() async {
  // String appDir = (await getApplicationDocumentsDirectory()).path;
  // String tempDir = (await getTemporaryDirectory()).path;
  Directory? storageDir = await getExternalStorageDirectory();
  print("外部存储路径:${storageDir?.path}");
  // return Image.file(File(storageDir+"abc.jpg"));
}

