import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/size.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: message != null
            ? [
                const Expanded(child: Divider()),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.vmin(0.02)),
                    child: Text(
                      message!,
                      style: GoogleFonts.poppins(),
                    )),
                const Expanded(child: Divider())
              ]
            : [const Expanded(child: Divider())]);
  }
}
