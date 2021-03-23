import 'package:flutter/material.dart';
import '../model/transacao.dart';
import 'package:intl/intl.dart';

class ListaTransacao extends StatelessWidget {
  final List<Transacao> _transacoes;

  ListaTransacao(this._transacoes);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _transacoes.map((e) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              'R\$${e.valor}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                e.titulo,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat.yMMMd().format(e.data),
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ));
    }).toList());
  }
}
