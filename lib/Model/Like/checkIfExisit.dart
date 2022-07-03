import 'package:crypties_app/exports.dart';


Future<bool> isExistLike(myUserId, postId, {communityId}) async {
  bool exists = false;
  try {
    if (communityId == null){
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(myUserId)
          .get()
          .then((doc) {
        if (doc.exists) {
          exists = true;
        } else {
          exists = false;
        }});
    } else {
      // await FirebaseFirestore.instance
      //     .collection('communities')
      //     .doc(communityId)
      //     .collection('posts')
      //     .doc(postId)
      //     .collection('likes')
      //     .doc(myUserId)
      //     .get()
      //     .then((doc) {
      //   if (doc.exists) {
      //     exists = true;
      //   } else {
      //     exists = false;
      //   }});
    }

    return exists;
  } catch (e) {
    return false;
  }
}
