import 'package:flutter/material.dart';
import 'package:flutter_demo/counter_model.dart';
import 'package:hello/hello.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with Calculator {
  int counter = 0;

  CounterModel count=CounterModel(0);

  final ValueNotifier<int> counterValueNotifier=ValueNotifier<int>(999);

  final CounterModel2 counterModel2=CounterModel2(100);

  void _incrementCounter() {
    // setState(() {
    // });
    counterModel2.value+=2;
    counterValueNotifier.value--;
    count.addOne();

  }


  @override
  void initState() {
    super.initState();
    count.addListener(() {
      counter=count.count;
      setState(() {

      });
    });
    counterModel2.addListener(() {
      debugPrint("Yayyyy");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GestureDetector(
              onTap: (){
                count.addOne();
                setState(() {});
              },
              onLongPress: (){
                setState(() {});
                count.removeOne();
              },
              child: Text(
                '$counter - ${counterValueNotifier.value} - ${counterModel2.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InheritedWidgetDecode extends InheritedWidget{
  const InheritedWidgetDecode({super.key,required super.child});

  static InheritedWidgetDecode of(BuildContext context) {
    final InheritedWidgetDecode? result = context.dependOnInheritedWidgetOfExactType<InheritedWidgetDecode>();
    assert(result != null, 'No InheritedWidgetDecode found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedWidgetDecode oldWidget) {
    return true;
  }
}
