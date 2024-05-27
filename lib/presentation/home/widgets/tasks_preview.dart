import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/domain/project.dart';
import 'package:todo_list/domain/status.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({super.key, this.projectsList = const []});
  final List<Project> projectsList;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _TaskPreviewWidget(status: const TaskStatus.ongoing(), count: projectsList),
          _TaskPreviewWidget(
            status: const TaskStatus.inProcess(),
            count: projectsList,
          )
        ])),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _TaskPreviewWidget(
              status: const TaskStatus.completed(),
              count: projectsList,
            ),
            _TaskPreviewWidget(status: const TaskStatus.canceled(), count: projectsList)
          ],
        ))
      ],
    );
  }
}

class _TaskPreviewWidget extends StatelessWidget {
  const _TaskPreviewWidget({required this.status, required this.count});
  final TaskStatus status;
  final List<Project> count;
  @override
  Widget build(BuildContext context) {
    var i = count.fold(0, (acc, c) => c.status == status ? acc + 1 : acc);
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
                          Text(i != 1 ? "$i Tasks" : "$i Task")
                        ])
                  ],
                ))));
  }
}
