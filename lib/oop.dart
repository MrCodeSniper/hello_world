///类
///
///


class Person{
  String name = "";
  int age = 0;
  ///1。标准构造方法
  Person(this.name,this.age);
  ///多态 可以重写父类方法 可以存在相同方法名 参数不同的方法
  @override
  String toString() {
    return "$name,$age";
  }
}

///继承
class Student extends Person{
  late String _school; //_修饰的为 私有变量
  late String city;
  late String desc;
  /// 子类构造必须继承父类 先完成父类的初始化
  /// this._school 初始化自有参数
  /// {}修饰的参数为可选参数 需要有默认值
  Student(this._school,String name, int age,{this.city = ""}) :
        desc = '$city . $_school', ///2。初始化列表 在构造调用之前初始化值
        super(name, age){
    /// 构造方法体
    print('constructor body');
  }

  ///3。命名构造方法
  Student.rename(Student student): super(student.name,student.age){
    print('constructor body');
  }
  /// 私有命名构造方法
  Student._internal():super("123",11);

  ///5.命名工厂构造方法 可以不用管final
  factory Student.create(Student stu){
    return Student(stu._school, stu.name, stu.age);
  }
  ///1.get方法 获取私有字段
  String get school => _school;

  ///2.set方法
  set school(String value){
    _school = value;
  }

  ///静态方法
  static print(String str){
    print("123 $str");
  }
}

void test(){
   Logger l1 = Logger();
   Logger l2 = Logger();
   Student s1 = Student.create(new Student("school","123",22));
   s1.school; //get方法
   s1._school;//当前文件可以访问私有字段
   s1.school = '123'; //set方法

   Student.print("str");

}

///4。通过工厂构造方法实现单例
class Logger{

  static Logger _only = Logger._internal();

  factory Logger(){
    return _only;
  }
  /// 私有命名构造方法
  Logger._internal();
}

///5.抽象与java一样 有抽象方法
abstract class Car{

  void engine();

  void desc(){
    print("car");
  }
}

class MyCar extends Car{
  @override
  void engine() {
    print("my engine");
  }

  int add(int a,int b){
    return a+b;
  }

  _private(){

  }

  map(){
    var list = [1,2,3];
    list.forEach((element) {
      ///这里就是一个匿名方法 也是一个闭包
    });
  }

}

/// 新扩展 通过with关键字 可以复用多个类
/// mixin是面向对象程序设计语言中的类，提供了方法的实现。其他类可以访问mixin类的方法、变量而不必成为其子类。
/// 有点接口的感觉 dart中没有interface  但Dart中是有接口的概念且任意类都可以作为接口。
/// 相比与接口 可以进一步的复用代码 不会出现接口冗余的情况
class Test extends Person with Car{

  Test(String name, int age) : super(name, age);

  @override
  void engine() {

  }

}