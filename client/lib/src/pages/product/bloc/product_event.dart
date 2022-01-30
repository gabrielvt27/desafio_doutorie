part of 'product_bloc.dart';

abstract class ProductEvent {}

class ProductUpdateEvent extends ProductEvent {
  final String? nome;
  final String? descricao;
  final double? valor;

  ProductUpdateEvent({
    this.nome,
    this.descricao,
    this.valor,
  });
}

class ProductFormSubmitEvent extends ProductEvent {}
