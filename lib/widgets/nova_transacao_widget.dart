import 'package:flutter/material.dart';

class NovaTransacao extends StatelessWidget {
  final Function adicionarTransacao;
  final tituloController = TextEditingController();
  final valorController = TextEditingController();

  NovaTransacao(this.adicionarTransacao);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
              controller: tituloController,
              onSubmitted: (_) => enviarTransacao(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              controller: valorController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => enviarTransacao(),
            ),
            TextButton(
              child: Text(
                'Adicionar Transação',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: enviarTransacao,
            ),
          ],
        ),
      ),
    );
  }

  void enviarTransacao() {
    final tituloDigitado = tituloController.text;
    final valorDigitado = double.parse(valorController.text);

    if (tituloDigitado.isEmpty || valorDigitado <= 0) {
      return;
    }
    adicionarTransacao(
      tituloDigitado,
      valorDigitado,
    );
  }
}
