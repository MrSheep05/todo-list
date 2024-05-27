import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/core/size.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({this.name, this.email, super.key});
  final String? name;
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Hi ${name ?? "..."} 👋",
          style: GoogleFonts.poppins(fontSize: context.vmin(0.06), fontWeight: FontWeight.bold),
        ),
        Text(email ?? "...", style: GoogleFonts.poppins(fontSize: context.vmin(0.04)))
      ]),
      Center(
          child: Container(
        width: context.vmin(0.12),
        height: context.vmin(0.12),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(context.vmin(0.02))),
        child: IconButton(
            color: Colors.black,
            onPressed: () async {
              await DialogAPI().showLoading();
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout)),
      )),
    ]);
  }
}
