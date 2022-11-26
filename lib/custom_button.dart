import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onPressed;
  CustomButton(this._onPressed);
  
  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: _onPressed,
      child: const Text('Click Me'),
    ));
  }
}
