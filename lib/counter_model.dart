import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier{
  int count;
  CounterModel(this.count);

  void addOne(){
    count++;
    notifyListeners();
  }

  void removeOne(){
    count--;
  }
}

class CounterModel2 implements ValueListenable<int>{

  CounterModel2(this._count);

  int _count;

  @override
  int get value => _count;

  set value(int newCount){
    if (_count == newCount) {
      return;
    }
    _count = newCount;
  }

  @override
  void addListener(VoidCallback listener) {
    print("add listener");
  }

  @override
  void removeListener(VoidCallback listener) {
    print("add listener 2");
  }

}