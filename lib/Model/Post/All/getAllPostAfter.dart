import 'package:crypties_app/exports.dart';

Future getAllAfter(timestamp) async {
  List posts = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('posts')
      .orderBy('createdAt', descending: true)
      .where('createdAt', isLessThan: timestamp)
      .limit(11)
      .get();

  await Future.forEach(value.docs.map((f) => f.data()), (f) async {
    if (f['isRetweet']){
      Map retweetedPost = await postToJason(await eachPost(f['previousPost']));
      if (retweetedPost['isReply']){
        retweetedPost['replyUserInfo'] = UserDomain.fromJson(await userInfo(retweetedPost['previousPostInfo']['userId']));
      }
      retweetedPost['retweetingUserInfo'] =UserDomain.fromJson(await userInfo(f['userId'])) ;
      return posts.add(retweetedPost);
    } else if (f['isReply']){
      Map data = await postToJason(f);

      data['replyUserInfo'] = UserDomain.fromJson(await userInfo(f['replyingUserId']));

      return posts.add(data);
    } else{
      return posts.add(await postToJason(f));
    }
  });

  return posts;

}
