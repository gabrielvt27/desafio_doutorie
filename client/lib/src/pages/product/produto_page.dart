import 'package:client/src/components/custom_elevated_button.dart';
import 'package:client/src/components/custom_textformfiel.dart';
import 'package:client/src/pages/product/bloc/form_status.dart';
import 'package:client/src/pages/product/bloc/product_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:client/src/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerDescr = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocListener<ProductBloc, ProductState>(
        listener: _showSnackBar,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return _buildForm(bloc, state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Form _buildForm(ProductBloc bloc, ProductState state) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Cadastro de Produtos",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding * 1.5,
          ),
          CustomTextFormField(
            label: "Nome",
            onChanged: (val) => bloc.add(
              ProductUpdateEvent(nome: val),
            ),
            controller: _controllerNome,
            validator: (val) =>
                state.isValidNome ? null : 'Nome não pode ser vazio',
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          CustomTextFormField(
            label: "Descrição",
            onChanged: (val) => bloc.add(
              ProductUpdateEvent(descricao: val),
            ),
            controller: _controllerDescr,
            validator: (val) =>
                state.isValidDescricao ? null : 'Descrição não pode ser vazia',
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          CustomTextFormField(
            label: "Valor",
            hintText: "R\$ 0,00",
            keyboardType: TextInputType.number,
            onChanged: (val) {
              bloc.add(
                ProductUpdateEvent(
                    valor: double.tryParse(val.replaceAll(',', '.'))),
              );
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]'))
            ],
            controller: _controllerValor,
            validator: (val) =>
                state.isValidValor ? null : 'Valor não pode ser zero',
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              child: state.formStatus is FormSubmitting
                  ? const SizedBox(
                      height: kDefaultPadding,
                      width: kDefaultPadding,
                      child: CircularProgressIndicator(
                        color: kBackgroundColor,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text("Enviar"),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  bloc.add(ProductFormSubmitEvent());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _showSnackBar(BuildContext context, ProductState state) {
    final formStatus = state.formStatus;

    if (formStatus is FormSubmitted) {
      _controllerNome.clear();
      _controllerDescr.clear();
      _controllerValor.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Produto cadastrado com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );
    } else if (formStatus is FormError) {
      _controllerNome.clear();
      _controllerDescr.clear();
      _controllerValor.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(formStatus.messageError),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
