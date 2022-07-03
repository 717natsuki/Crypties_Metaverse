import 'package:crypties_app/exports.dart';

Future eachPost(postId) async {

  DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .get();
  Map record = docSnapshot.data();
  return record;
}

Future getEachPostInformation(postId)async{
  List posts = [];
  Map dataPost =await  eachPost(postId);

  if (dataPost['isRetweet']){
    Map retweetedPost = await postToJason(await eachPost(dataPost['previousPost']));
    retweetedPost['retweetingUserInfo'] =UserDomain.fromJson(await userInfo(dataPost['userId']));
    if (retweetedPost['isReply']){
      retweetedPost['replyUserInfo'] = UserDomain.fromJson(await userInfo(retweetedPost['previousPostInfo']['userId']));
    }
    posts.add(retweetedPost);
  } else if (dataPost['isReply']){
    Map data = await postToJason(dataPost);

    data['replyUserInfo'] = UserDomain.fromJson(await userInfo(dataPost['replyingUserId']));

    posts.add(data);
  } else{
    posts.add(await postToJason(dataPost));
  }
return posts[0];
}