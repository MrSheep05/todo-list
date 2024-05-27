import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/widgets/loading.dart';
import 'package:todo_list/presentation/widgets/snackbar_content.dart';

class DialogAPI {
  static final DialogAPI _singleton = DialogAPI._internal();
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  final goRouter = GetIt.instance.get<GoRouter>();
  GlobalKey<NavigatorState> get navigatorKey => goRouter.routerDelegate.navigatorKey;
  BuildContext? _dialogContext;
  bool showing = false;
  factory DialogAPI() {
    return _singleton;
  }

  void maybeShowSnackBar(String message,
      {Severity? severity, Duration duration = const Duration(seconds: 2), String? exception}) {
    var contentType = severity ?? Severity.success;
    if (!showing) _snackBar(message, contentType, duration, exception);
  }

  void showSnackBar(String message,
      {Severity? severity, Duration duration = const Duration(seconds: 2), String? exception}) {
    var contentType = severity ?? Severity.success;

    _snackBar(message, contentType, duration, exception);
  }

  void importantSnackbar(
    String message, {
    Severity? severity,
    Duration duration = const Duration(seconds: 3),
    String? exception,
  }) {
    var contentType = severity ?? Severity.error;
    messengerKey.currentState!.clearSnackBars();
    _snackBar(message, contentType, duration, exception);
  }

  Future<void> showLoading() async {
    if (navigatorKey.currentContext != null) {
      showDialog(
          barrierDismissible: false,
          context: navigatorKey.currentContext!,
          builder: (BuildContext context) {
            _dialogContext = context;
            return const AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Loading()]));
          });
    }
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void dismissLoading() {
    if (_dialogContext != null && navigatorKey.currentState != null && navigatorKey.currentContext != null) {
      var navigator = Navigator.of(navigatorKey.currentContext!, rootNavigator: true);
      navigator.canPop() ? navigator.pop() : navigatorKey.currentState!.popUntil((route) => true);
      _dialogContext = null;
    }
  }

  void _snackBar(String message, Severity severity, Duration duration, String? exception) {
    var isExceptionOnDebugMode = !kReleaseMode && exception != null;
    var errorMessageDependOnReleaseMode = isExceptionOnDebugMode ? exception : message;
    var errorDurationDependsOnReleaseMode = isExceptionOnDebugMode ? const Duration(seconds: 10) : duration;
    if (messengerKey.currentState != null) {
      showing = true;
      Future.delayed(duration, () => showing = false);
      messengerKey.currentState!.showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          duration: errorDurationDependsOnReleaseMode,
          behavior: SnackBarBehavior.floating,
          content: SnackbarContent(
            severity: severity,
            message: errorMessageDependOnReleaseMode,
          )));
    }
  }

  DialogAPI._internal();
}

enum Severity {
  warning,
  info,
  error,
  success;

  Color get textColor => switch (this) {
        Severity.info => const Color(0xFFE8F5FE),
        Severity.warning => const Color(0xFF525152),
        Severity.error => Colors.white,
        Severity.success => Colors.white,
      };

  Color get backgroundColor => switch (this) {
        Severity.info => const Color(0xFF5693F2),
        Severity.warning => const Color(0xFFFEC247),
        Severity.error => const Color(0xFFF26E56),
        Severity.success => const Color(0xFF53C2C5),
      };
  IconData get icon => switch (this) {
        Severity.info => Icons.comment_outlined,
        Severity.warning => Icons.info_outline_rounded,
        Severity.error => Icons.error_outline_rounded,
        Severity.success => Icons.check_rounded,
      };
}
