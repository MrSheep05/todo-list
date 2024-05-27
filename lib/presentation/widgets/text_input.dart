import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';

class TextInput extends StatelessWidget {
  TextInput(
      {this.width = 0.85,
      this.height = 0.12,
      super.key,
      this.label,
      this.hint,
      this.controller,
      this.isHidden = false,
      this.errorSignal,
      this.maxLength,
      this.maxLines = 1});
  final double width;
  final double height;

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool isHidden;
  final Signal<bool>? errorSignal;
  final int? maxLength;
  final int? maxLines;

  final currentLength = signal(0);
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
    return SizedBox(
        width: context.vmin(width),
        height: context.vmin(height + 0.01),
        child: Stack(children: [
          Container(
              width: context.vmin(width),
              height: context.vmin(height),
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
                maxLines: maxLines,
                controller: controller,
                obscureText: isHidden,
                autofocus: false,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
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
                onChanged: (text) {
                  errorSignal?.set(false);
                  currentLength.set(text.length);
                },
                onTapOutside: (_) => FocusScope.of(context).requestFocus(FocusNode()),
              )),
          if (maxLength != null)
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: EdgeInsets.only(right: context.vmin(width * 0.02), top: context.vmin(0.05)),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "$currentLength/$maxLength",
                          style: GoogleFonts.poppins(
                              fontSize: context.vmin(0.025),
                              color: currentLength.watch(context) > maxLength! ? Colors.red : Colors.black),
                        ))))
        ]));
  }
}
