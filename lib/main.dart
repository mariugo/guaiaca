import 'package:flutter/material.dart';
import './widgets/usuario_transacoes_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final tituloController = TextEditingController();
  final valorController = TextEditingController();
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('Gráfico...'),
                    elevation: 5,
                    color: Colors.blue,
                  ),
                ),
                UsuarioTransacoes(),
              ],
            ),
          )),
    );
  }
}
