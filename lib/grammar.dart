
import 'package:flutter/material.dart';

    /**
 *   Dart语言
 *   强类型，静态语言 - 意味着编译时需要声明变量类型
 *   面向对象 - 具备四特性 封装 继承 抽象 多态
 *   JIT (just in time)- 即时编译 开发期间
 *   AOT (ahead of time)- 事前编译 运行期间
 *
 *   总的包括
 *   1.数据类型
 *   2.基本对象类型
 *   3.函数/方法
 *   4.泛型
 *   5.异步
 *   6.高级运用
    */


void main(){
      ///数字类型 都可以表示int double
      num n = 1;
      num n1 = 1.0;
      num n2 = 1.22222;
      n.abs(); ///获取绝对值
      n1.toInt(); ///类型转换
      n1.toDouble();
      n1.toString();
      String s = "123", s1 = "111";
      String s2 = s + s1;
      String s3 = '$s$s1'; ///字符串拼接
      s3.substring(1,2); ///字符串截取
      s2.indexOf(","); ///获取字符串的位置
      bool success = true;
      bool fail = false;
      ///逻辑表达式 与或非
      success || fail;
      success && fail;
      !success;
      ///dart里存在动态数据类型  类型var由编译器保证类型
      ///dynamic 动态数据类型 运行中推测
      ///object 所有类型的基础 静态类型会检查
      ///var 任意的数据类型 一旦被确定无法修改
      List<dynamic> list = [1,'a',true]; ///初始化集合 与JAVA不同 list里可以放不同类型的数据
      List<num> list2 = [1,2,3]; ///当设置了泛型 内部元素强制该类型
      list = list2; ///类型不同无法赋值转换
      list.add('test');///添加元素
      list.remove('a');///移除元素
      List<dynamic> list3 = [10];
      list.addAll(list3);///添加集合
      List list4 = List.generate(3, (index) => index*2);///集合生成函数 长度为3 值为下标*2
      ///集合遍历 包含下标 去掉下标
      for(int i=0;i<list4.length;i++){
         print(list[i]);
      }
      for(var value in list4){
         print(value);
      }
      list4.forEach((element) {
        print(element);
      });
      /// map
      Map map = {'key1':'value2','key2':'value2'};
      map['key3'] = 'value3';
      /// 遍历 key,value
      map.forEach((key, value) {
        print('$key,$value');
      });
      /// map映射 类似rxjava 从1个类型转换另外一个类型
      Map reverseMap = map.map((key, value){
        return MapEntry(value, key);
      });

      for(var key in map.keys){

      }

      for(var value in map.values){

      }

      for(var entry in map.entries){
           entry.key;
           entry.value;
      }
      /// 与kotlin很像 高级语言都是相似的
}