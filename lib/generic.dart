
class TestGeneric{
  ///dart中所有类型都是对象引用类型
  Cache<int> cache = new Cache();
  bool b1 = true;
}

/// 泛型 上限 和下限 类似与java的super ? 这些
class Cache<T>{

}

class Memo<T extends Cache<T>>{

}