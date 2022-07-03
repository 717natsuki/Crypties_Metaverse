
import 'package:crypties_app/exports.dart';

void createUserView(nickname, email, password, context,)async{

  showProgressBar(context);

  dynamic result = await createUser(nickname, email, password);
  await new Future.delayed(new Duration(seconds: 1));

  if (result == true){
    Navigator.of(context).pop();

    Navigator.pushNamed(
        context,kNavigatorString.loading);
    // Navigator.pushNamedAndRemoveUntil(
    //     context, kNavigatorString.connectMetamask, ModalRoute.withName(''));
    // create first post
    try{
      // createPostModel(FirebaseAuth.instance.currentUser.uid, 'ガクチャに登録しました！皆さんよろしくお願いします☺️ \n #初めての投稿',null,blackPost);
    } catch(e){
      debugPrint(e.toString());
    }

  } else {
    Navigator.of(context).pop();
    String errorMessage;
    switch (result.code) {
      case "invalid-email":
        errorMessage = "This email is invalid. Please check the format.";
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "This password is invalid. Please check the format";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "This user does not exist. Please check the email.";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "This user is disabled. Please try later.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests from this user. Please try later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "There is an operational error happening. Please try later.";
        break;
      case "ERROR_WEAK_PASSWORD":
        errorMessage = "Password is too short.";
        break;
      case "email-already-in-use":
        errorMessage = "This email has been used already.";
        break;
      default:
        errorMessage = "There is an error. Please try again.";
    }
    errorPopup('Error',errorMessage,context);
  }
}

