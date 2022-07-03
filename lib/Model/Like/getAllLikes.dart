import 'package:crypties_app/exports.dart';


Future getAllLikesModel(postId) async {
  // analytics('getAllLikesModel', 15);

  List users = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('likes')
      .orderBy('createdAt', descending: true)
      .limit(15)
      .get();

  await Future.forEach(value.docs.map((f) => f.data()), (f) async {

    return users.add({
      'userInfo': UserDomain.fromJson(await userInfo(f['userId'])),
      'userId': f['userId'],
      "createdAt": f['createdAt'],
      'postId':  f['postId'],
    });
  });
  return users;
}