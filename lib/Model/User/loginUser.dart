import 'package:crypties_app/exports.dart';

Future loginUser(email, password) async {
  try {
    // showProgressBar(context);

    final User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    )).user;



    return true;
  } catch (e) {
    return e;
  }
}
