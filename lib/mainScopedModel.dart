import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScopedModel(
          model: CounterModel(),
          child: const CounterHome('Scoped Model Demo'),
        )
    );
  }
}

class CounterHome extends StatelessWidget {
  final String title;

  const CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScopedModelDescendant<CounterModel>(
                builder: (context, child, model) {
                  return GestureDetector(
                    child: Text(
                      model.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    onTap: model.increment,
                  );
                },
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: ScopedModel.of<CounterModel>(context).increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
    );
  }
}