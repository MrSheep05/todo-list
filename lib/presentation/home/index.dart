import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list/controllers/home_controller.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/presentation/home/widgets/header.dart';
import 'package:todo_list/presentation/home/widgets/task.dart';
import 'package:todo_list/presentation/home/widgets/tasks_preview.dart';
import 'package:todo_list/presentation/widgets/navigation_footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = GetIt.instance.get<HomeController>();
    var account = homeController.accountSignal.watch(context);
    var projectList = homeController.projectsList.watch(context).value;
    return Scaffold(
        bottomNavigationBar: const NavigationFooter(),
        body: Padding(
            padding: EdgeInsets.all(context.vmin(0.05)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: HomeHeader(
                        name: account?.username,
                        email: account?.email,
                      )),
                  Expanded(
                      flex: 2,
                      child: TaskPreview(
                        projectsList: projectList ?? [],
                      )),
                  Expanded(
                      flex: 5,
                      child: Padding(
                          padding: EdgeInsets.only(top: context.vmin(0.05)),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Recent tasks",
                                    style: GoogleFonts.poppins(fontSize: context.vmin(0.05)),
                                  )),
                              Expanded(
                                  child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: projectList
                                        ?.map<Widget>((e) => TaskWidget(
                                              e,
                                              key: UniqueKey(),
                                            ))
                                        .toList() ??
                                    [],
                              )),
                            ],
                          )))
                ],
              ),
            )));
  }
}
