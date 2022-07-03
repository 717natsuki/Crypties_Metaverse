import 'package:crypties_app/exports.dart';




Future getAllQuotesAfterModel(postId, timestamp) async {
  // analytics('getAllLikesModel', 15);

  List users = [];
  List posts = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('replies')
      .orderBy('createdAt', descending: true)
      .where('createdAt', isLessThan: timestamp)
      .limit(4)
      .get();

  await Future.forEach(value.docs.map((f) => f.data()), (f) async {
    Map postInfo = await eachPost(f['postId']);

    if (postInfo['isRetweet']){
      Map retweetedPost = await postToJason(await eachPost(postInfo['previousPost']));
      retweetedPost['retweetingUserInfo'] =UserDomain.fromJson(await userInfo(postInfo['userId']));
      if (retweetedPost['isReply']){
        retweetedPost['replyUserInfo'] = UserDomain.fromJson(await userInfo(retweetedPost['previousPostInfo']['userId']));
      }
      return posts.add(retweetedPost);
    } else if (postInfo['isReply']){
      Map data = await postToJason(postInfo);

      data['replyUserInfo'] = UserDomain.fromJson(await userInfo(postInfo['replyingUserId']));

      return posts.add(data);
    } else{

      return posts.add(await postToJason(postInfo));
    }

    return users.add({
      'userId': f['userId'],
      "createdAt": f['createdAt'],
      'postId':  f['postId'],
    });
  });


  return posts;
}