import 'package:flutter/material.dart';
import '../model/transacao.dart';
import '../widgets/lista_transacao_widget.dart';
import '../widgets/nova_transacao_widget.dart';

class UsuarioTransacoes extends StatefulWidget {
  @override
  _UsuarioTransacoesState createState() => _UsuarioTransacoesState();
}

class _UsuarioTransacoesState extends State<UsuarioTransacoes> {
  final List<Transacao> _usuarioTransacoes = [];

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
    return Column(
      children: <Widget>[
        NovaTransacao(_adicionarNovaTransacao),
        ListaTransacao(_usuarioTransacoes),
      ],
    );
  }
}
