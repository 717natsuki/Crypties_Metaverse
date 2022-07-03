import 'package:crypties_app/exports.dart';


void deleteFollowing(userId, followingUserId) async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('followings')
      .doc(followingUserId)
      .delete();

  FirebaseFirestore.instance
      .collection('users')
      .doc(followingUserId)
      .collection('followers')
      .doc(userId)
      .delete();

  FirebaseFirestore.instance
      .collection('users')
      .doc(followingUserId)
      .collection('publicMetrics')
      .doc('publicMetrics')
      .update({
    'follower':FieldValue.increment(-1),
  });

  FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('publicMetrics')
      .doc('publicMetrics')
      .update({
    'following':FieldValue.increment(-1),
  });
}
