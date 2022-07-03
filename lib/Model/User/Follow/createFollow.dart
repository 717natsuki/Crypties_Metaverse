import 'package:crypties_app/exports.dart';

void createFollowing(userId, followingUserId) async {
  //create badge
  // createBadge(followingUserId, 'reaction');
  // createBadge(followingUserId, 'notification');
  try{
    print('sdsodfosi');

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('followings')
        .doc(followingUserId)
        .set({
      "following":followingUserId,
      "userId": userId,
      "createdAt": DateTime.now(),
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(followingUserId)
          .collection('followers')
          .doc(userId)
          .set({
        "followingUserId":followingUserId,
        "userId": userId,
        "createdAt": DateTime.now(),
      });
    }).then((value) {
      //create notification
      FirebaseFirestore.instance
          .collection('users')
          .doc(followingUserId)
          .collection('notifications')
          .doc()
          .set({
        "userId": userId,
        "type":5,
        "createdAt": DateTime.now(),
      });
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(followingUserId )
          .collection('publicMetrics')
          .doc('publicMetrics')
          .update({
        'follower':FieldValue.increment(1),
      });
    }).then((value) {

      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('publicMetrics')
          .doc('publicMetrics')
          .update({
        'following':FieldValue.increment(1),
      });
    });


  }catch(e){
    debugPrint(e.toString());

  }

}
