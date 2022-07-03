import 'package:crypties_app/exports.dart';


Future getAllQuotesModel(postId) async {
  // analytics('getAllLikesModel', 15);

  List users = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('quotes')
      .orderBy('createdAt', descending: true)
      .limit(4)
      .get();

  await Future.forEach(value.docs.map((f) => f.data()), (f) async {
    DocumentSnapshot docSnapshot;
    docSnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(f['postId'])
        .get();

    Map record = docSnapshot.data();
    if (record['isRetweet']){
      Map retweetedPost = await postToJason(await eachPost(record['previousPost']));
      if (retweetedPost['isReply']){
        retweetedPost['replyUserInfo'] = UserDomain.fromJson(await userInfo(retweetedPost['previousPostInfo']['userId']));
      }
      retweetedPost['retweetingUserInfo'] =UserDomain.fromJson(await userInfo(record['userId'])) ;
      return users.add(retweetedPost);
    } else if (record['isReply']){
      Map data = await postToJason(record);

      data['replyUserInfo'] = UserDomain.fromJson(await userInfo(record['replyingUserId']));

      return users.add(data);
    } else{
      return users.add(await postToJason(record));
    }
    // return posts.add(await postToJason(record));
  });
  return users;
}