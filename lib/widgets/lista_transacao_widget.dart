import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transacao.dart';

class ListaTransacao extends StatelessWidget {
  final List<Transacao> transacoes;

  ListaTransacao(this.transacoes);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text('R\$${transacoes[index].valor}'),
                  ),
                ),
              ),
              title: Text(
                transacoes[index].titulo,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transacoes[index].data),
              ),
            ),
          );
        },
        itemCount: transacoes.length,
      ),
    );
  }
}
