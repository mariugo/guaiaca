import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NovaTransacao extends StatefulWidget {
  final Function adicionarTransacao;
  NovaTransacao(this.adicionarTransacao);

  @override
  _NovaTransacaoState createState() => _NovaTransacaoState();
}

class _NovaTransacaoState extends State<NovaTransacao> {
  final _tituloController = TextEditingController();
  final _valorController = TextEditingController();
  DateTime? _dataTransacao;

  void _mostrarCalendario() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((dataEscolhida) {
      if (dataEscolhida == null) {
        return;
      }
      setState(() {
        _dataTransacao = dataEscolhida;
      });
    });
  }

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
              controller: _tituloController,
              onSubmitted: (_) => _enviarTransacao(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              controller: _valorController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _enviarTransacao(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_dataTransacao == null
                        ? 'Nenhuma data escolhida'
                        : 'Data escolhida: ${DateFormat.yMd().format(_dataTransacao!)}'),
                  ),
                  TextButton(
                    onPressed: _mostrarCalendario,
                    child: Text(
                      'Escolher Data',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text(
                'Adicionar Transação',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: _enviarTransacao,
            ),
          ],
        ),
      ),
    );
  }

  void _enviarTransacao() {
    final tituloDigitado = _tituloController.text;
    final valorDigitado = double.parse(_valorController.text);

    if (tituloDigitado.isEmpty || valorDigitado <= 0) {
      return;
    }
    widget.adicionarTransacao(
      tituloDigitado,
      valorDigitado,
    );
    Navigator.of(context).pop();
  }
}
