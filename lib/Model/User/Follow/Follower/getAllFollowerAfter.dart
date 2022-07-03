import 'package:crypties_app/exports.dart';


Future getAllFollowerAfterModel(postId, timestamp) async {
  // analytics('getAllLikesAfterModel', 15);

  List users = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('users')
      .doc(postId)
      .collection('followers')
      .orderBy('createdAt', descending: true)
      .where('createdAt', isLessThan: timestamp)
      .limit(10)
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