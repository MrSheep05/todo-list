import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/domain/status.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _TaskPreviewWidget(status: TaskStatus.ongoing()),
          _TaskPreviewWidget(status: TaskStatus.inProcess())
        ])),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _TaskPreviewWidget(status: TaskStatus.completed()),
            _TaskPreviewWidget(status: TaskStatus.canceled())
          ],
        ))
      ],
    );
  }
}

class _TaskPreviewWidget extends StatelessWidget {
  const _TaskPreviewWidget({super.key, required this.status});
  final TaskStatus status;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(context.vmin(0.01)),
            child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.vmin(0.03)), color: status.backgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: context.vmin(0.07),
                      backgroundColor: status.iconColor,
                      child: Icon(
                        status.icon,
                        color: Colors.white,
                        size: context.vmin(0.1),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(status.text, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                          const Text("15 Tasks")
                        ])
                  ],
                ))));
  }
}
