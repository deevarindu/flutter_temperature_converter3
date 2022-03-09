import 'package:flutter/material.dart';

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key? key,
    required this.inputCelcius,
  }) : super(key: key);

  final TextEditingController inputCelcius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputCelcius,
      decoration: InputDecoration(
        labelText: 'Celcius',
        hintText: 'Masukkan Suhu dalam Celcius',
      ),
      keyboardType: TextInputType.number,
    );
  }
}
