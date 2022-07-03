import 'package:crypties_app/exports.dart';


void createLikeModel(userId, postId, likeUserId, {communityId}) async {
  //create badge
print('dsofjsaiodfasd');
  try{
    if (likeUserId != userId){
      // createBadge(userId, 'reaction');
      // createBadge(userId, 'notification');
      print('?????');
      FirebaseFirestore.instance
          .collection('users')
          .doc(likeUserId)
          .collection('notifications')
          .doc()
          .set({
        "userId": userId,
        "type":1, //like
        'postId': postId,
        "createdAt": DateTime.now(),
      });
    }
    if(await isExistLike(FirebaseAuth.instance.currentUser.uid, postId,) ){
      print('exist!');
    } else {
      if (communityId == null){
        print('like~ $postId $likeUserId');
        FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .collection('likes')
            .doc(userId)
            .set({
          "userId": userId,
          'postId': postId,
          "createdAt": DateTime.now(),
        }).then((value) {
        }).then((value) {
          FirebaseFirestore.instance
              .collection('posts')
              .doc(postId)
              .collection('publicMetrics')
              .doc('publicMetrics')
              .update({
            "likeNum": FieldValue.increment(1),
          });
          FirebaseFirestore.instance
              .collection('posts')
              .doc(postId)
              .update({
            "likeNum": FieldValue.increment(1),
          });
        });
      } else {

      }
    }


  }catch(e){
    print(e.toString());

  }

}
