import 'package:flutter/material.dart';

import '../lang.dart';

class PassForm extends StatefulWidget {
  PassForm({Key? key}) : super(key: key);
  final passFormController = TextEditingController();

  @override
  State<PassForm> createState() => _PassFormState();
}

class _PassFormState extends State<PassForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Lang.of(context).password,
      ),
      obscureText: true,
    );
  }
}
