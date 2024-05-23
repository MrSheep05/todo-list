import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/controllers/login_controller.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/presentation/widgets/button.dart';
import 'package:todo_list/presentation/widgets/custom_divider.dart';
import 'package:todo_list/presentation/widgets/single_child_scroll.dart';
import 'package:todo_list/presentation/widgets/text_input.dart';
import 'package:todo_list/routes/paths.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    var loginController = GetIt.instance.get<LoginController>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: EdgeInsets.all(context.vmin(0.05)),
            child: Center(
              child: SingleChildScroll(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.all(context.vmin(0.05)),
                          child: Text(
                            "Sign in👋",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(fontSize: context.vmin(0.08)),
                          ))),
                  TextInput(
                    label: "Login",
                    hint: "Example@gmail.com",
                    controller: loginController.loginController,
                  ),
                  SizedBox(
                    height: context.vmin(0.1),
                  ),
                  TextInput(
                    label: "Password",
                    hint: "*********",
                    controller: loginController.passwordController,
                    isHidden: true,
                  ),
                  SizedBox(
                    height: context.vmin(0.1),
                  ),
                  Button(
                    "Continue",
                    onPressed: () async => await loginController.signIn(),
                  ),
                  SizedBox(
                    height: context.vmin(0.1),
                  ),
                  const CustomDivider(
                    message: "Or",
                  ),
                  SizedBox(
                    height: context.vmin(0.02),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do not have an account? ",
                        style: GoogleFonts.poppins(),
                      ),
                      InkWell(
                        onTap: () => navigate(Paths.REGISTER),
                        child: Text(
                          "Create one right now!",
                          style: GoogleFonts.poppins(
                              color: theme.colorScheme.primary, decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              )),
            )));
  }
}
