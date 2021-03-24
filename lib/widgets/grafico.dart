import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transacao.dart';

class Grafico extends StatelessWidget {
  final List<Transacao> transacoesRecentes;

  Grafico(this.transacoesRecentes);

  List<Map<String, Object>> get valoresTransacoes {
    return List.generate(7, (index) {
      final diaSemana = DateTime.now().subtract(Duration(days: index));
      double somaTotal = 0.0;

      for (var i = 0; i < transacoesRecentes.length; i++) {
        if (transacoesRecentes[i].data.day == diaSemana.day &&
            transacoesRecentes[i].data.month == diaSemana.month &&
            transacoesRecentes[i].data.year == diaSemana.year) {
          somaTotal += transacoesRecentes[i].valor;
        }
      }

      return {'day': DateFormat.E(diaSemana), 'valor': somaTotal};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
