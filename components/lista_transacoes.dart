import 'package:flutter/material.dart';
import '../models/transacao.dart';
import 'package:intl/intl.dart';

class ListaTransacoes extends StatelessWidget{
  final List<Transacao> transacoes;

  ListaTransacoes(this.transacoes);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transacoes.isEmpty ? Column(
        children: [
          Text(
            'Nehuma transação cadastrada',
            style: Theme.of(context).textTheme.headline6
          ),
        ]
      ) : ListView(
        children: [
          ...transacoes.map((tr) {
            return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'R\$ ${tr.valor.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                        )
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.titulo,
                        style: Theme.of(context).textTheme.headline6
                        //TextStyle(
                        //    fontSize: 16,
                        //    fontWeight: FontWeight.bold
                        //),
                      ),
                      Text(
                        DateFormat('d/MM/y').format(tr.data),
                        style: TextStyle(
                            color: Colors.grey.shade500
                        ),
                      ),

                    ],
                  )
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}