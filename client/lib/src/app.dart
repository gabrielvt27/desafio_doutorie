import 'package:client/src/constants.dart';
import 'package:client/src/pages/product/bloc/product_bloc.dart';
import 'package:client/src/pages/product/produto_page.dart';
import 'package:client/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Verdana",
        primaryColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/product': (context) => BlocProvider(
              create: (context) => ProductBloc(),
              child: ProductPage(),
            ),
      },
      initialRoute: '/',
    );
  }
}
