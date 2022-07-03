import 'package:crypties_app/exports.dart';

Future<bool> isFollowingUser(userId, followingUserId) async {

  bool exists = false;

  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('followings')
        .doc(followingUserId)
        .get()
        .then((doc) {
      if (doc.exists)
        exists = true;
      else
        exists = false;
    });
    return exists;
  } catch (e) {
    return false;
  }
}
