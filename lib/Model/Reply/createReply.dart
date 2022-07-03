import 'package:crypties_app/exports.dart';


Future<bool> createReplyModel(userId, text,replyingPostInfo, url, {communityId, }) async {
  try{
    String documentId;
    if (communityId == null){
      DocumentReference ref = FirebaseFirestore.instance
          .collection('posts')
          .doc();
      documentId = ref.id;
      Map unigram = {};
      for (int i = 0; text.length > i; i++){
        unigram[text[i]] = true;
      }

      ref.set({
        'unigram':unigram,
        'isInappropriate':false,
        "userId": userId,
        'isDeleted': false,
        'text': text,
        'postId': documentId,
        "updatedAt": FieldValue.serverTimestamp(),
        "createdAt": FieldValue.serverTimestamp(),
        "isReply": true,
        "isRetweet": false,
        'hashtags': extractHashTags(text),
        'previousPost':replyingPostInfo['postId'],
        'image1':url,
        'image2':null,
        'image3':null,
        'image4':null,
        'isQuote':false,
        'replyingUserId':replyingPostInfo['userInfo'].userId
      });

      FirebaseFirestore.instance
          .collection('posts')
          .doc(replyingPostInfo['postId'])
          .collection('replies')
          .doc(documentId)
          .set({
        "userId": userId,
        'postId':documentId,
        "updatedAt": DateTime.now(),
        "createdAt": DateTime.now(),
        'postUserId':replyingPostInfo['userInfo'].userId
      });

      FirebaseFirestore.instance
          .collection('posts')
          .doc(documentId)
          .collection('publicMetrics')
          .doc('publicMetrics')
          .set({
        "replyNum": 0,
        'likeNum': 0,
        "retweetNum": 0,
        "quoteNum": 0,
        "userId": userId,
      });

      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('myPosts')
          .doc(documentId)
          .set({
        "userId": userId,
        'postId':documentId,
        "updatedAt": FieldValue.serverTimestamp(),
        "createdAt": FieldValue.serverTimestamp(),
      });
      QuerySnapshot value = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('followers')
          .get();
      value.docs.forEach((f) async {
        print(f.get('userId').toString());
        print('dfsodifjsdoif  $documentId');
        FirebaseFirestore.instance
            .collection('users')
            .doc(f.get('userId'))
            .collection('timeline')
            .doc(documentId)
            .set({
          "userId": f.get('userId'),
          'postId':documentId,
          "createdAt": FieldValue.serverTimestamp(),
        });
      });

      // to my own timeline
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('timeline')
          .doc(documentId)
          .set({
        "userId": userId,
        'postId':documentId,
        "createdAt": FieldValue.serverTimestamp(),
      });
      FirebaseFirestore.instance
          .collection('posts')
          .doc(replyingPostInfo['postId'])
          .collection('publicMetrics')
          .doc('publicMetrics')
          .update({
        "replyNum": FieldValue.increment(1),
      });

      FirebaseFirestore.instance
          .collection('posts')
          .doc(replyingPostInfo['postId'])
          .update({
        "replyNum": FieldValue.increment(1),
      });
      if (userId != replyingPostInfo['userInfo'].userId){
        // createBadge(postUserInfo['userId'], 'notification');
        FirebaseFirestore.instance
            .collection('users')
            .doc(replyingPostInfo['userInfo'].userId)
            .collection('notifications')
            .doc()
            .set({
          "userId": FirebaseAuth.instance.currentUser.uid,
          "type":3, //like
          'postId': documentId,
          "createdAt": FieldValue.serverTimestamp(),
        });

      }
    } else {

    }
    // createTagModel(text, documentId, communityId); //TODO: 本当はcommunityIdも追加することも忘れない！
    return true;
  } catch(e){
    return false;
  }
}
