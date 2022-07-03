import 'package:crypties_app/exports.dart';


Future getAllRetweetAfterModel(postId, timestamp) async {
  // analytics('getAllLikesAfterModel', 15);

  List users = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('retweets')
      .orderBy('createdAt', descending: true)
      .where('createdAt', isLessThan: timestamp)
      .limit(15)
      .get();
  await Future.forEach(value.docs.map((f) => f.data()), (f) async {
    return users.add({
      'userId': f['userId'],
      'userInfo': UserDomain.fromJson(await userInfo(f['userId'])),
      "createdAt": f['createdAt'],
      'postId':  f['postId'],
    });
  });
  // adScroll();

  return users;
}