import 'package:flutter/material.dart';

class FormTransacao extends StatelessWidget {

  final tituloController = TextEditingController();
  final valorController = TextEditingController();

  final void Function(String, double) onSubmit;

  FormTransacao(this.onSubmit);

  submitForm(){
    final titulo = tituloController.text;
    final valor = double.tryParse(valorController.text) ?? 0.0;

    if(titulo.isEmpty || valor <= 0){
      return;
    }
    onSubmit(titulo, valor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_)=>submitForm(),
              controller: tituloController,
              decoration: InputDecoration(
                  labelText: 'Título'
              ),
            ),
            TextField(
              onSubmitted: (_)=>submitForm(),
              keyboardType: TextInputType.number,
              controller: valorController,
              decoration: InputDecoration(
                  labelText: 'Valor (R\$)'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: ()=>submitForm(),
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
