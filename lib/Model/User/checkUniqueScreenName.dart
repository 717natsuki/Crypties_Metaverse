import 'package:crypties_app/exports.dart';


Future<bool> isExistScreenName(myUserId, screenName) async {
  bool exists = false;
  try {
      await FirebaseFirestore.instance
          .collection('users')
          .where('screenName', isEqualTo: screenName)
          .limit(2)
            .get()
          .then((doc) {
        if (doc.docs.isNotEmpty) {
          exists = true;
        } else {
          exists = false;
        }});
    return exists;
  } catch (e) {
    return false;
  }
}
