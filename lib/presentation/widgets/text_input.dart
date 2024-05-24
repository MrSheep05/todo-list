import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {this.width = 0.85, super.key, this.label, this.hint, this.controller, this.isHidden = false, this.errorSignal});
  final double width;
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool isHidden;
  final Signal<bool>? errorSignal;
  @override
  Widget build(BuildContext context) {
    var error = errorSignal?.watch(context);
    var conditionColor = (error ?? false) ? theme.colorScheme.error : theme.colorScheme.primary;
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(context.vmin(0.05)),
      ),
      gapPadding: 4.0,
      borderSide: BorderSide(width: 2.0, style: BorderStyle.solid, color: conditionColor),
    );
    return Container(
        width: context.vmin(width),
        height: context.vmin(0.12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: conditionColor,
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
            enabledBorder: border,
            border: border,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(context.vmin(0.05)),
              ),
              gapPadding: 4.0,
              borderSide: BorderSide(width: 3.0, style: BorderStyle.solid, color: conditionColor),
            ),
            focusColor: conditionColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: label != null
                ? Text(
                    label!,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: conditionColor),
                  )
                : null,
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: (_) => errorSignal?.set(false),
          onTapOutside: (_) => FocusScope.of(context).requestFocus(FocusNode()),
        ));
  }
}
