import 'package:crypties_app/exports.dart';

void destroyPostModel(postId, {communityId}) async {
  if (communityId == null){
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .update({
      'isDeleted':true
    });
    try{
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('myPosts')
          .doc(postId)
          .delete();
    }catch (e){
      debugPrint(e.toString());
    }
  }
}
