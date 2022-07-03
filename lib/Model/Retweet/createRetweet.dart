import 'package:crypties_app/exports.dart';

Future<bool>  createRetweetPost(userId, quotePostInfo, userDomain, {communityId}) async {
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


      ref.set({
        'unigram':{},
        'isInappropriate':false,
        "userId": userId,
        'isDeleted': false,
        'text': null,
        'postId': documentId,
        "updatedAt": FieldValue.serverTimestamp(),
        "createdAt": FieldValue.serverTimestamp(),
        "isReply": false,
        "isRetweet": true,
        'hashtags': null,
        'previousPost':quotePostInfo['postId'],
        'image1':null,
        'image2':null,
        'image3':null,
        'image4':null,
        'isQuote':false,
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
          .collection('retweets')
          .doc(userId)
          .set({
        "userId": userId,
        'postId':documentId,
        "updatedAt": DateTime.now(),
        "createdAt": DateTime.now(),
        'postUserId':userDomain.userId
      });
      FirebaseFirestore.instance
          .collection('posts')
          .doc(quotePostInfo['postId'])
          .collection('publicMetrics')
          .doc('publicMetrics')
          .update({
        "retweetNum": FieldValue.increment(1),
      });
      FirebaseFirestore.instance
          .collection('posts')
          .doc(quotePostInfo['postId'])
          .update({
        "retweetNum": FieldValue.increment(1),
      });


      if (userId != userDomain.userId){
        FirebaseFirestore.instance
            .collection('users')
            .doc(userDomain.userId)
            .collection('notifications')
            .doc()
            .set({
          "userId": FirebaseAuth.instance.currentUser.uid,
          "type":4, //like
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
