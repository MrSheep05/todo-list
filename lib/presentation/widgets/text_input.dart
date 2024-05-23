import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';

class TextInput extends StatelessWidget {
  const TextInput({this.width = 0.85, super.key, this.label, this.hint, this.controller, this.isHidden = false});
  final double width;
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool isHidden;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.vmin(width),
        height: context.vmin(0.12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary,
                offset: const Offset(0, 21),
                blurRadius: 0,
                spreadRadius: -18,
              )
            ]),
        child: TextField(
          controller: controller,
          obscureText: isHidden,
          autofocus: false,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: label != null
                ? Text(
                    label!,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  )
                : null,
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            hoverColor: theme.primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(context.vmin(0.05)),
              ),
              gapPadding: 4.0,
              borderSide: BorderSide(width: 2.0, style: BorderStyle.solid, color: theme.colorScheme.primary),
            ),
          ),
          onTapOutside: (_) => FocusScope.of(context).requestFocus(FocusNode()),
        ));
  }
}
