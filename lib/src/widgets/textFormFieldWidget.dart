import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String textFieldText;
  final bool obscureText;
  final Function textField;
  final Function validator;
  TextFieldWidget({
    @required this.obscureText,
    @required this.validator,
    this.textField,
    this.textFieldText,
    @required this.node,
  });

  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$textFieldText",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Hz",
            color: Color(0xFF707070),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          validator: validator,
          obscureText: obscureText,
          onChanged: textField,
          focusNode: node,
          style: TextStyle(
            fontFamily: "Hz",
            height: 1.1,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
