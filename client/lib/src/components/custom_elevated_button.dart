import 'package:flutter/material.dart';

import 'package:client/src/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget? child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          textStyle: const TextStyle(
            fontSize: 24,
          ),
        ),
        child: child,
      ),
    );
  }
}
