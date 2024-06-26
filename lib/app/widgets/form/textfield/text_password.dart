import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QTextPassword extends StatefulWidget {
  const QTextPassword({
    required this.label,
    required this.onChanged,
    super.key,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    this.onSubmitted,
    this.obscure,
    this.enabled = true,
    this.prefixIcon,
  });

  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool? obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  @override
  State<QTextPassword> createState() => _QTextPasswordState();
}

class _QTextPasswordState extends State<QTextPassword> {
  TextEditingController textEditingController = TextEditingController();
  bool _passwordVisible = true;
  @override
  void initState() {
    textEditingController.text = widget.value ?? '';
    super.initState();
  }

  String getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = '';
  }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();





  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: TextFormField(
        enabled: widget.enabled,
        controller: textEditingController,
        focusNode: focusNode,
        obscureText: _passwordVisible,
        validator: widget.validator,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                if(_passwordVisible==true){
                  _passwordVisible = false;
                }else{
                  _passwordVisible = true;
                }
              });
            },
              icon : Icon(Icons.remove_red_eye)
          ),
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
