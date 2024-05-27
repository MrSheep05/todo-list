import 'package:flutter/material.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/routes/paths.dart';

class NavigationFooter extends StatelessWidget {
  const NavigationFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightPer(0.08),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white, border: Border(top: BorderSide(color: theme.colorScheme.primary, width: 2.0))),
      child: Center(
          child: CircleAvatar(
              radius: context.vmin(0.06),
              backgroundColor: theme.colorScheme.primary,
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  navigate(Paths.ADD_TASK);
                },
              ))),
    );
  }
}
