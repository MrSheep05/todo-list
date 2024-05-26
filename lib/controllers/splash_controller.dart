import 'package:firebase_auth/firebase_auth.dart';
import 'package:signals/signals.dart';
import 'package:todo_list/infrastructure/models/iuser_repository.dart';
import 'package:todo_list/routes/paths.dart';

var auth = FirebaseAuth.instance;

class SplashController {
  final AccountRepository accountRepo;
  final userStream = streamSignal(auth.userChanges, initialValue: auth.currentUser);

  User? get user => userStream.value.value;
  SplashController(this.accountRepo) {
    effect(_handleUserChange);
  }

  Future<void> _handleUserChange() async {
    if (user == null) {
      navigate(Paths.LOGIN);
    } else {
      await accountRepo.getAccountTask(user!).map((r) => navigate(Paths.HOME)).run();
    }
  }
}
