import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/domain/project.dart';
import 'package:todo_list/domain/status.dart';
import 'package:todo_list/infrastructure/core/date_time.dart';
import 'package:todo_list/infrastructure/models/iprojects_repository.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget(this.project, {super.key});

  final Project project;

  @override
  State<TaskWidget> createState() => _TaskWidgetState(project);
}

class _TaskWidgetState extends State<TaskWidget> {
  _TaskWidgetState(this.project);
  final Project project;
  bool enabled = false;
  final projectRepo = GetIt.instance.get<ProjectsRepository>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: context.vmin(0.02)),
        child: Container(
            width: context.vmin(0.7),
            height: enabled ? context.vmin(0.5) : context.vmin(0.3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle,
                border: Border.all(color: theme.colorScheme.primary, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary,
                    offset: const Offset(0, 21),
                    blurRadius: 0,
                    spreadRadius: -18,
                  )
                ]),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.vmin(0.04))
                    .add(EdgeInsets.only(top: context.vmin(0.04), bottom: context.vmin(0.02))),
                child: Column(children: [
                  Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        project.title,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold, fontSize: context.vmin(0.05)),
                                      )),
                                  Expanded(
                                      child: SizedBox(
                                          width: context.vmin(0.5),
                                          child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Text(
                                                project.description.length > 50 && !enabled
                                                    ? "${project.description.substring(0, 50)}..."
                                                    : project.description,
                                                softWrap: true,
                                                textAlign: TextAlign.justify,
                                              )))),
                                  if (enabled)
                                    Text(
                                      project.timestamp!.toDateTimeString(),
                                      style: GoogleFonts.poppins(),
                                    )
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: PopupMenuButton(
                                  onSelected: (status) async {
                                    await DialogAPI().showLoading();
                                    project.updateStatus(status);
                                    await projectRepo
                                        .updateProjectStatus(project)
                                        .mapLeft((l) => DialogAPI().showSnackBar(l.message, severity: Severity.warning))
                                        .map((r) => DialogAPI().showSnackBar("Successfuly updated status of task"))
                                        .run();
                                    DialogAPI().dismissLoading();
                                  },
                                  initialValue: project.status,
                                  itemBuilder: (_) => [
                                        const TaskStatus.completed(),
                                        const TaskStatus.canceled(),
                                        const TaskStatus.inProcess(),
                                        const TaskStatus.ongoing()
                                      ]
                                          .map((s) => PopupMenuItem(
                                                value: s,
                                                child: Center(
                                                    child: CircleAvatar(
                                                  radius: context.vmin(0.07),
                                                  backgroundColor: s.iconColor,
                                                  child: Icon(
                                                    s.icon,
                                                    color: Colors.white,
                                                    size: context.vmin(0.12),
                                                  ),
                                                )),
                                              ))
                                          .toList() as List<PopupMenuEntry<TaskStatus>>,
                                  child: CircleAvatar(
                                    radius: context.vmin(0.08),
                                    backgroundColor: project.status.iconColor,
                                    child: Icon(
                                      project.status.icon,
                                      color: Colors.white,
                                      size: context.vmin(0.1),
                                    ),
                                  )))
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () => setState(() => enabled = !enabled),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: Divider()),
                              Icon(enabled ? Icons.expand_less : Icons.expand_circle_down_outlined),
                              const Expanded(child: Divider())
                            ])),
                  )
                ]))));
  }
}
