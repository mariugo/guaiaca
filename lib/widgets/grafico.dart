import 'package:flutter/material.dart';
import 'package:guaiaca/widgets/barras_grafico.dart';
import 'package:intl/intl.dart';
import '../model/transacao.dart';

class Grafico extends StatelessWidget {
  final List<Transacao> transacoesRecentes;

  Grafico(this.transacoesRecentes);

  List<Map<String, Object>> get valoresTransacoesAgrupadas {
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

      return {
        'dia': DateFormat.E().format(diaSemana).substring(0, 1),
        'valor': somaTotal,
      };
    });
  }

  double get maximoGasto {
    return valoresTransacoesAgrupadas.fold(
        0, (soma, item) => soma + double.parse(item['valor'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: valoresTransacoesAgrupadas
              .map((data) => Flexible(
                    fit: FlexFit.tight,
                    child: BarrasGrafico(
                      letraSemana: data['dia'].toString(),
                      valorGasto: (data['valor'] as double),
                      porcentagemGasta: maximoGasto == 0
                          ? 0
                          : (data['valor'] as double) / maximoGasto,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
