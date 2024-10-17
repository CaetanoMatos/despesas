import './components/form_transacao.dart';
import 'package:flutter/material.dart';
import './models/transacao.dart';
import './components/lista_transacoes.dart';
import 'dart:math';

main() => runApp(AppDespesas());

class AppDespesas extends StatelessWidget{
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.amber,
            secondary: Colors.amber.shade800,
          ),
          textTheme: tema.textTheme.copyWith(
            headline6: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans'
            )
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'
            )
          )
        ),
    );
  }
}

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transacao> transacoes = [];

  addTransacao(String titulo, double valor){
    final novaTransacao = Transacao(
        id: Random().nextDouble().toString(),
        titulo: titulo,
        data: DateTime.now(),
        valor: valor
    );

    setState(() {
      transacoes.add(novaTransacao);
    });
    Navigator.of(context).pop();
  }

  abrirModalFormTransacao(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (_){
          return FormTransacao(addTransacao);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
              onPressed: ()=>abrirModalFormTransacao(context),
              icon: Icon(Icons.add)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>abrirModalFormTransacao(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico', textAlign: TextAlign.center),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          //UsuarioTransacao()
          //FormTransacao(addTransacao),
          ListaTransacoes(transacoes)
        ],
      )
    );
  }
}