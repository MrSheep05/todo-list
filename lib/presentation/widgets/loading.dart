import 'package:flutter/material.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    var size = context.vmin(0.2);
    return SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
          color: theme.colorScheme.secondary,
        ));
  }
}
