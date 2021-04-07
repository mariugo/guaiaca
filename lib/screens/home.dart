import 'package:flutter/material.dart';

import '../widgets/lista_transacao_widget.dart';
import '../model/transacao.dart';
import '../widgets/nova_transacao_widget.dart';
import '../widgets/grafico.dart';

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

  void _adicionarNovaTransacao(
      String titulo, double valor, DateTime dataEscolhida) {
    final novaTransacao = Transacao(
      id: DateTime.now().toString(),
      titulo: titulo,
      valor: valor,
      data: dataEscolhida,
    );

    setState(() {
      _usuarioTransacoes.add(novaTransacao);
    });
  }

  void _deletarTransacao(String id) {
    setState(() {
      _usuarioTransacoes.removeWhere((value) => value.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final myAppBar = AppBar(
      title: Text('Guaiaca'),
    );
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height -
                        myAppBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Grafico(_usuarioTransacoesRecentes),
              ),
              Container(
                height: (MediaQuery.of(context).size.height -
                        myAppBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: ListaTransacao(_usuarioTransacoes, _deletarTransacao),
              ),
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
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return AnimatedPadding(
            padding: (MediaQuery.of(context).viewInsets),
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: NovaTransacao(_adicionarNovaTransacao),
          );
        });
  }
}
