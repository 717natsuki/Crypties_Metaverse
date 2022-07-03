import 'package:crypties_app/exports.dart';


Future getAllFollowingModel(userId) async {
  // analytics('getAllLikesModel', 15);

  List users = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('followings')
      .orderBy('createdAt', descending: true)
      .limit(10)
      .get();

  await Future.forEach(value.docs.map((f) => f.data()), (f) async {

    return users.add({
      'userInfo': UserDomain.fromJson(await userInfo(f['following'])),
      'userId': f['userId'],
      "createdAt": f['createdAt'],
      'postId':  f['postId'],
    });
  });

  return users;
}