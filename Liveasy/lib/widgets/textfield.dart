import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/core/constants/labelstyle.dart';

class Textfield extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keytype;
  final double bdrds;
  final bool isValid;
  final String? hint;
  final String? pref;
  final String? lbtxt;
  final bool obsecuretext;
  final Widget? suffix;

  const Textfield({Key? key,
    this.validator,
    this.controller,
    required this.bdrds,
    this.lbtxt,
    this.hint,
    this.pref,
    this.keytype,
    required this.obsecuretext, required this.isValid, this.suffix,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obsecuretext,
      keyboardType: keytype,
      decoration: InputDecoration( contentPadding: EdgeInsets.all(25),
        filled: true,
        fillColor: Colors.grey.shade200,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(bdrds),
        ),
        labelText: lbtxt,
        labelStyle: Labelstyle.Default_txt,
        hintText: hint,
        prefix: Text(pref ?? ''),

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(bdrds),
        ),
        suffixIcon: isValid
            ? suffix
            : null,
      ),
    );
  }
}
