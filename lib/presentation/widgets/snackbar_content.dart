import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/core/size.dart';

class SnackbarContent extends StatelessWidget {
  const SnackbarContent({super.key, required this.severity, required this.message});
  final Severity severity;
  final String message;
  @override
  Widget build(BuildContext context) {
    final color = severity.backgroundColor;
    final textColor = severity.textColor;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.widthPer(0.02)),
        child: Stack(clipBehavior: Clip.none, alignment: Alignment.topCenter, children: [
          Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxWidth: context.widthPer(0.95),
                minWidth: context.widthPer(0.6),
                minHeight: context.heightPer(0.05),
              ),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(context.heightPer(0.025))),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 66, 60, 60).withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: const Offset(0, 3))
                  ]),
              child: Padding(
                  padding: EdgeInsets.only(left: context.widthPer(0.01)),
                  child: Stack(children: [
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(severity.icon, color: textColor, size: context.vmin(0.05)),
                    )),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.vmin(0.06)),
                          child: Center(
                              child: AutoSizeText(message,
                                  style: GoogleFonts.poppins(color: textColor, backgroundColor: Colors.transparent)))),
                    )
                  ])))
        ]));
  }
}
