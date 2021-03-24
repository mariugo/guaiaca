import 'package:flutter/material.dart';
import 'package:guaiaca/widgets/grafico.dart';
import '../widgets/lista_transacao_widget.dart';
import '../model/transacao.dart';
import '../widgets/nova_transacao_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tituloController = TextEditingController();
  final valorController = TextEditingController();
  final List<Transacao> _usuarioTransacoes = [];

  List<Transacao> get _usuarioTransacoesRecentes {
    return _usuarioTransacoes.where((element) {
      return element.data.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void _adicionarNovaTransacao(String titulo, double valor) {
    final novaTransacao = Transacao(
        id: DateTime.now().toString(),
        titulo: titulo,
        valor: valor,
        data: DateTime.now());

    setState(() {
      _usuarioTransacoes.add(novaTransacao);
    });
  }

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
                child: Grafico(_usuarioTransacoesRecentes),
              ),
              ListaTransacao(_usuarioTransacoes),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _iniciarModal(context),
        ),
      ),
    );
  }

  void _iniciarModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NovaTransacao(_adicionarNovaTransacao),
            behavior: HitTestBehavior.opaque,
          );
        });
  }
}
