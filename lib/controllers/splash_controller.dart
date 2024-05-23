import 'package:firebase_auth/firebase_auth.dart';
import 'package:signals/signals.dart';
import 'package:todo_list/routes/paths.dart';

var auth = FirebaseAuth.instance;

class SplashController {
  final userStream = streamSignal(auth.userChanges);

  User? get user => userStream.value.value;
  SplashController() {
    userStream.set(AsyncState.data(auth.currentUser));

    effect(_handleUserChange);
  }

  Future<void> _handleUserChange() async {
    if (user == null) {
      navigate(Paths.LOGIN);
    } else {
      navigate(Paths.HOME);
    }
  }
}
