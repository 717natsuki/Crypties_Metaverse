import 'package:crypties_app/exports.dart';

Future getFollowingAfter(timestamp) async {
  List posts = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('timeline')
      .orderBy('createdAt', descending: true)
      .where('createdAt', isLessThan: timestamp)
      .limit(6)
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
      return posts.add(retweetedPost);
    } else if (record['isReply']){
      Map data = await postToJason(record);

      data['replyUserInfo'] = UserDomain.fromJson(await userInfo(record['replyingUserId']));

      return posts.add(data);
    } else{
      return posts.add(await postToJason(record));
    }
    // return posts.add(await postToJason(record));
  });

  return posts;

}
