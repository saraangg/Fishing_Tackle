import 'package:e_commerce/core/constants/labelstyle.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String? lbtxt;
  final String? hint;
  final String? pref;
  final Color? fcsclr;
  final double bdrds;
  final bool isValid;
  final Widget? suffix;
  final AutovalidateMode? valid;
  final ValueChanged<String>? onchange;
  final TextEditingController? controller;
  final bool obsecuretext;
  final String? Function(String?)? validator;
  final void Function(String?)? on_saveds; // Add this parameter
  final String? Function(String?)? Validators;
  final TextInputType? keytype;

  const Textfield({
    Key? key,
     this.lbtxt,
     this.fcsclr,
    required this.bdrds,
    required this.isValid,
    required this.obsecuretext,
    this.onchange,
    this.suffix, this.valid,
    this.validator,
    this.controller,
    this.on_saveds,
    this.Validators,  this.hint, this.pref, this.keytype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,
            autovalidateMode: valid,
            obscureText: obsecuretext,
keyboardType: keytype,
        controller:controller ,
        onSaved: on_saveds,
        decoration: InputDecoration( contentPadding: EdgeInsets.all(25),
          filled: true,
          fillColor: Colors.grey.shade200,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(bdrds),
          ),
          labelText: lbtxt,
          labelStyle: Labelstyle.Default_txt,
          focusColor: fcsclr,
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
        style: Labelstyle.Field_txt.copyWith(fontSize: 14.0),
       onChanged: onchange,
      );
  }
}