import 'package:flutter/material.dart';

import 'package:client/src/constants.dart';
import 'package:client/src/components/custom_elevated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logo.png"),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/product');
              },
              text: "Cadastrar Produto",
            ),
          ],
        ),
      ),
    );
  }
}
