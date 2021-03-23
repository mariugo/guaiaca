import 'package:flutter/material.dart';

class NovaTransacao extends StatelessWidget {
  final Function adicionarTxt;
  final tituloController = TextEditingController();
  final valorControler = TextEditingController();

  NovaTransacao(this.adicionarTxt);

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
              controller: valorControler,
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              child: Text(
                'Adicionar Transação',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                adicionarTxt(
                  tituloController.text,
                  double.parse(valorControler.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
