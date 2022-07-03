import 'package:crypties_app/Domain/Post/publicMetrics.dart';
import 'package:crypties_app/Model/Post/getPublicMetrics.dart';
import 'package:crypties_app/Model/Quote/checkIfExisit.dart';
import 'package:crypties_app/Model/Reply/checkIfExisit.dart';
import 'package:crypties_app/Model/Retweet/checkIfExisit.dart';
import 'package:crypties_app/exports.dart';
import 'package:crypties_app/Model/Post/getEachPost.dart';
Future<Map> postToJason(f) async {
  print('asiofioasdoifsdiofs');
  Map data = await userInfo(f['userId']);
  // Map metrics = await postPublicMetrics(f['postId']);
  bool isLiked = await isExistLike(FirebaseAuth.instance.currentUser.uid, f['postId']);
  // bool isRetweeted = await isExistRetweet(FirebaseAuth.instance.currentUser.uid, f['postId']);
  // bool isQuoted = await isExistQuoted(FirebaseAuth.instance.currentUser.uid, f['postId']);
  // bool isReplied = await isExistReplied(FirebaseAuth.instance.currentUser.uid, f['postId']);
  Map previousPost = f['previousPost'] == null ? null : await eachPost(f['previousPost']);
  Map previousPostUserInfo = f['previousPost'] == null ? null : await userInfo(previousPost['userId']);
  // print(f['previousPost'].toString());
  // print('sdfoiasdjfioasd');

  // bool isRetweeted = false;
  bool isQuoted = false;
  bool isReplied = false;

  return await {
    "unigram": f['unigram'],
    'isInappropriate': f['isInappropriate'],
    'text': f['text'],
    'isDeleted': f['isDeleted'],
    'userId': f['userId'],
    'createdAt': f['createdAt'],
    'postId': f['postId'],
    'isReply': f['isReply'],
    'isQuote': f['isQuote'],
    // 'isReply': f['isReply'],
    'previousPostInfo': previousPost,
    'previousPostUserInfo':previousPostUserInfo != null ? UserDomain.fromJson(previousPostUserInfo): null,
    'image': f['image'],
    'shareCommunity': f['shareCommunity'],
    'isRetweet': f['isRetweet'],
    "updatedAt": f['isRetweet'],
    'hashtags': f['hashtags'],
    'image1':f['image1'],
    'image2':f['image2'],
    'image3':f['image3'],
    'image4':f['image4'],
    'userInfo':UserDomain.fromJson(data) ,
    // 'publicMetrics': PostPublicMetrics.fromJson(metrics),
    'isLiked':isLiked,
    'isRetweeted':false,
    'isQuoted':isQuoted,
    'isReplied':isReplied,

    'quoteNum':f['quoteNum'],
    'retweetNum':f['retweetNum'],
    'likeNum':f['likeNum'],
    'replyNum':f['replyNum'],

  };
}


Future<Map> notificationToJason(f) async {
  Map data = await userInfo(f['userId']);
  Map metrics = await postPublicMetrics(f['postId']);
  bool isLiked = await isExistLike(FirebaseAuth.instance.currentUser.uid, f['postId']);
  bool isRetweeted = await isExistRetweet(FirebaseAuth.instance.currentUser.uid, f['postId']);
  // bool isQuoted = await isExistQuoted(FirebaseAuth.instance.currentUser.uid, f['postId']);
  // bool isReplied = await isExistReplied(FirebaseAuth.instance.currentUser.uid, f['postId']);
  // bool isRetweeted = false;
  bool isQuoted = false;
  bool isReplied = false;
  Map previousPost = {};

  Map postInfo = await eachPost(f['postId']);
  print(postInfo.toString());

  if (postInfo == null){
    previousPost = null;
  } else {
    previousPost = postInfo['previousPost'] == null ? null : await eachPost(postInfo['previousPost']);

  }

  print(previousPost.toString());
  print('dfoasdjfosdf');
  // Map previousPost = await eachPost(f['previousPost']);

  return await {
    'userId': f['userId'],
    'createdAt': f['createdAt'],
    'postId': f['postId'],
    "updatedAt": f['isRetweet'],
    'type': f['type'],
    'postInfo':postInfo,
    'previousPost':previousPost,
    'userInfo':UserDomain.fromJson(data) ,
  };
}