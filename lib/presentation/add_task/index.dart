import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/controllers/task_controller.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/presentation/widgets/button.dart';
import 'package:todo_list/presentation/widgets/single_child_scroll.dart';
import 'package:todo_list/presentation/widgets/text_input.dart';
import 'package:todo_list/routes/paths.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    var taskController = GetIt.instance.get<TaskController>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: EdgeInsets.all(context.vmin(0.05)),
            child: Center(
                child: SingleChildScroll(SizedBox(
              height: context.heightPer(1),
              width: context.widthPer(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: context.vmin(0.12),
                          height: context.vmin(0.12),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: const Color(0xFFEDEDED),
                              borderRadius: BorderRadius.circular(context.vmin(0.02))),
                          child: IconButton(
                              color: Colors.black,
                              onPressed: () => navigate(Paths.HOME),
                              icon: const Icon(Icons.arrow_back_rounded)),
                        )),
                  ),
                  Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("New Task", style: GoogleFonts.poppins(fontSize: context.vmin(0.08)))),
                          SizedBox(height: context.widthPer(0.04)),
                          TextInput(
                            label: "Title",
                            hint: "...",
                            controller: taskController.titleController,
                            maxLength: 50,
                            errorSignal: taskController.titleError,
                          ),
                          SizedBox(height: context.widthPer(0.1)),
                          TextInput(
                            label: "Description",
                            hint: "...",
                            maxLength: 200,
                            height: 0.25,
                            maxLines: 5,
                            controller: taskController.descriptionController,
                            errorSignal: taskController.descriptionError,
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(children: [
                        Button(
                          "Create Task",
                          onPressed: () async => await taskController.createProject(),
                        )
                      ]))
                ],
              ),
            )))));
  }
}
