part of 'product_bloc.dart';

class ProductState {
  final String nome;
  final String descricao;
  final double valor;
  FormStatus formStatus = InitialFormStatus();

  bool get isValidNome => nome.isNotEmpty;
  bool get isValidDescricao => descricao.isNotEmpty;
  bool get isValidValor => valor > 0;

  ProductState({
    required this.nome,
    required this.descricao,
    required this.valor,
    required this.formStatus,
  });

  ProductState.empty({
    this.nome = '',
    this.descricao = '',
    this.valor = 0.0,
  });

  ProductState copyWith({
    String? nome,
    String? descricao,
    double? valor,
    FormStatus? formStatus,
  }) {
    return ProductState(
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      valor: valor ?? this.valor,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
      'valor': valor,
    };
  }

  @override
  String toString() =>
      'ProductState(nome: $nome, descricao: $descricao, valor: $valor)';
}
