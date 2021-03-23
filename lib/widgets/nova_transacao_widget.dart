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
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              controller: valorController,
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              child: Text(
                'Adicionar Transação',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                adicionarTransacao(
                  tituloController.text,
                  double.parse(valorController.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
