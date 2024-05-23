import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';

class Button extends StatelessWidget {
  const Button(this.title, {this.width = 0.85, super.key, this.onPressed});
  final double width;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.vmin(width),
        height: context.vmin(0.12),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(context.vmin(0.05))))),
            onPressed: onPressed,
            child: Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )));
  }
}
