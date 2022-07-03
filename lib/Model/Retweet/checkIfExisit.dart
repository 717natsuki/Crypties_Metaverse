import 'package:crypties_app/exports.dart';


Future<bool> isExistRetweet(myUserId, postId, {communityId}) async {
  bool exists = false;
  try {
    if (communityId == null){
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('retweets')
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
