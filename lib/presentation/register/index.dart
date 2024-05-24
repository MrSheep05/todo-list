import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list/controllers/login_controller.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/presentation/widgets/button.dart';
import 'package:todo_list/presentation/widgets/custom_divider.dart';
import 'package:todo_list/presentation/widgets/single_child_scroll.dart';
import 'package:todo_list/presentation/widgets/text_input.dart';
import 'package:todo_list/routes/paths.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context) {
    var loginController = GetIt.instance.get<LoginController>();
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(context.vmin(0.05)),
            child: Center(
                child: SingleChildScroll(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.all(context.vmin(0.05)),
                          child: Text(
                            "Create Account👋",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(fontSize: context.vmin(0.08)),
                          ))),
                  TextInput(
                    label: "Username",
                    hint: "CoolGuy123",
                    controller: loginController.usernameController,
                    errorSignal: loginController.usernameError,
                  ),
                  SizedBox(
                    height: context.vmin(0.1),
                  ),
                  TextInput(
                    label: "Login",
                    hint: "Example@gmail.com",
                    controller: loginController.loginController,
                    errorSignal: loginController.loginError,
                  ),
                  SizedBox(
                    height: context.vmin(0.1),
                  ),
                  TextInput(
                    label: "Password",
                    hint: "*********",
                    controller: loginController.passwordController,
                    isHidden: true,
                    errorSignal: loginController.passwordError,
                  ),
                  SizedBox(
                    height: context.vmin(0.1),
                  ),
                  const Button("Continue"),
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
                        "Have an account already? ",
                        style: GoogleFonts.poppins(),
                      ),
                      InkWell(
                        onTap: () => navigate(Paths.LOGIN),
                        child: Text(
                          "Sign in instead!",
                          style: GoogleFonts.poppins(
                              color: theme.colorScheme.primary, decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))));
  }
}
