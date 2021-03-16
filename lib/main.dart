import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guaiaca',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Guaiaca'),
          ),
          body: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Gráfico...'),
                  elevation: 5,
                  color: Colors.blue,
                ),
              ),
              Card(
                child: Text('Conteúdo'),
              ),
            ],
          )),
    );
  }
}
