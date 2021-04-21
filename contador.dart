import 'package:flutter/material.dart';


void main() => runApp(Contador());

class Contador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'CONTADOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(String estado) {
    setState(() {
      if (_counter <= 9) {
        if (estado == 'Aumentar') {
          _counter++;
        }
      }
      if (_counter >= -9) {
        if (estado == 'Disminuir') {
          _counter--;
        }
      }
      if (_counter != 0) {
        if (estado == 'Reiniciar') {
          _counter = 0;
        }
      }
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
          children: [
            Text(
              'Aumentar - Reiniciar - Disminuir:',
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter('Reiniciar');
              },
              child: Text('Reiniciar Contador'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                _incrementCounter('Disminuir');
              },
              child: Text('Disminuir Contador'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                _incrementCounter('Aumentar');
              },
              child: Text('Aumentar Contador'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Au',
        child: Icon(Icons.add),
      ),
    );
  }
}
