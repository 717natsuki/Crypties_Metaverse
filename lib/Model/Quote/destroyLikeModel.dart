import 'package:crypties_app/exports.dart';



void destroyLikeModel(userId, postId, likeUserId, {communityId}) async {
  if (communityId == null){
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(likeUserId)
        .delete();

    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('publicMetrics')
        .doc('publicMetrics')
        .update({
      "likes": FieldValue.increment(-1),
    });

    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .update({
      "likeNum": FieldValue.increment(-1),
    });

  } else {

    // print('deleteing community post likes');
    // FirebaseFirestore.instance
    //     .collection('communities')
    //     .doc(communityId)
    //     .collection('posts')
    //     .doc(postId)
    //     .collection('likes')
    //     .doc(likeUserId)
    //     .delete();
    // FirebaseFirestore.instance
    //     .collection('communities')
    //     .doc(communityId)
    //     .collection('posts')
    //     .doc(postId)
    //     .update({
    //   "likes": FieldValue.increment(-1),
    // });
  }

}
