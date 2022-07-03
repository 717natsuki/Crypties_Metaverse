import 'package:crypties_app/exports.dart';


Future getAllPost() async {
  List posts = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('posts')
      .orderBy('createdAt', descending: true)
      .limit(6)
      .get();

  await Future.forEach(value.docs.map((f) => f.data()), (f) async {
    print("SODFOISIOSD");
    if (f['isRetweet']){
      Map retweetedPost = await postToJason(await eachPost(f['previousPost']));
      retweetedPost['retweetingUserInfo'] =UserDomain.fromJson(await userInfo(f['userId']));
      if (retweetedPost['isReply']){
       retweetedPost['replyUserInfo'] = UserDomain.fromJson(await userInfo(retweetedPost['previousPostInfo']['userId']));
      }
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

