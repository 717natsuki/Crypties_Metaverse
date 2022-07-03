import 'package:crypties_app/exports.dart';

Future<bool>  createQuotePost(userId, text, quotePostInfo, url,userDomain, {communityId}) async {
try{
  String documentId;
  //create badge
  if (userId != userDomain.userId){
    // createBadge(postUserInfo['userId'], 'notification');
  }


  // change by if if community or not
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
      "isReply": false,
      "isRetweet": false,
      'hashtags': extractHashTags(text),
      'previousPost':quotePostInfo['postId'],
      'image1':url,
      'image2':null,
      'image3':null,
      'image4':null,
      'isQuote':true,
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
      FirebaseFirestore.instance
          .collection('users')
          .doc(f.get('userId'))
          .collection('timeline')
          .doc(documentId)
          .set({
        "userId": userId,
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
        .doc(quotePostInfo['postId'])
        .collection('quotes')
        .doc(documentId)
        .set({
      "userId": userId,
      'postId':documentId,
      "updatedAt": FieldValue.serverTimestamp(),
      "createdAt":FieldValue.serverTimestamp(),
      'postUserId':userDomain.userId
    });
    FirebaseFirestore.instance
        .collection('posts')
        .doc(quotePostInfo['postId'])
        .collection('publicMetrics')
        .doc('publicMetrics')
        .update({
      "quoteNum": FieldValue.increment(1),
    });
    FirebaseFirestore.instance
        .collection('posts')
        .doc(quotePostInfo['postId'])
        .update({
      "quoteNum": FieldValue.increment(1),
    });

    if (userId != userDomain.userId){
      // createBadge(postUserInfo['userId'], 'notification');

      FirebaseFirestore.instance
          .collection('users')
          .doc(userDomain.userId)
          .collection('notifications')
          .doc()
          .set({
        "userId": FirebaseAuth.instance.currentUser.uid,
        "type":2, //like
        'postId': documentId,
        "createdAt": FieldValue.serverTimestamp(),
      });
    }
  } else {}

  return true;

}catch(e){
  return false;

}
}
