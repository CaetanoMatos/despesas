class Transacao{
  final String id;
  final String titulo;
  final double valor;
  final DateTime data;

  Transacao({
    required this.id,
    required this.titulo,
    required this.data,
    required this.valor,
  });
}