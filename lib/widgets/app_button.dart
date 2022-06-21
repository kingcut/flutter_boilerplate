import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/dimens.dart';

class AppButtonLarge extends StatelessWidget {
  const AppButtonLarge({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.heightButton,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: Dimens.textButtonSizeLarge),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
