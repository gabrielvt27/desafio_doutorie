import 'package:bloc/bloc.dart';
import 'package:client/src/constants.dart';
import 'package:client/src/pages/product/bloc/form_status.dart';
import 'package:dio/dio.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final dio = Dio();

  ProductBloc() : super(ProductState.empty()) {
    on<ProductUpdateEvent>((event, emit) {
      emit(
        state.copyWith(
          nome: event.nome,
          descricao: event.descricao,
          valor: event.valor,
        ),
      );
    });

    on<ProductFormSubmitEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await dio.post('$kApiUrl/product', data: state.toMap());
        emit(state.copyWith(formStatus: FormSubmitted()));
      } catch (e) {
        emit(
          state.copyWith(
            formStatus:
                FormError(messageError: "Não foi possível cadastrar produto!"),
          ),
        );
      }

      emit(ProductState.empty());
    });
  }
}
