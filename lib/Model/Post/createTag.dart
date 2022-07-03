import 'package:crypties_app/exports.dart';

void createTagModel(text, postId, communityId) async {
  final List<String> hashTags = extractHashTags(text);

  for(int i = 0; i < hashTags.length; i++){

    FirebaseFirestore.instance
        .collection('hashtags')
        .doc(hashTags[i])
        .set({
      "hashtag": hashTags[i],
      "createdAt":FieldValue.serverTimestamp(),
    });

    FirebaseFirestore.instance
        .collection('hashtags')
        .doc(hashTags[i])
        .collection('posts')
        .doc(postId)
        .set({
      "postId": postId,
      'userId':FirebaseAuth.instance.currentUser.uid,
      'communityId':communityId, //コミュニティ投稿の場合これが nullにならない
      "createdAt":FieldValue.serverTimestamp(),
    });
  }
}
