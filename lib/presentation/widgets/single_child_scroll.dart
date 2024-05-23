import 'package:flutter/material.dart';

class SingleChildScroll extends StatelessWidget {
  const SingleChildScroll(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()), child: child);
  }
}
