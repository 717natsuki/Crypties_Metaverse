import 'package:crypties_app/exports.dart';

Future getReaction() async {
  // analytics('getReaction', 10);
  List posts = [];
  QuerySnapshot value = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('notifications')
      .where('type', whereIn: [1,4,5])
      .orderBy('createdAt', descending: true)

      .limit(5)
      .get();

    await Future.forEach(value.docs.map((f) => f.data()), (f) async {
      return posts.add(await notificationToJason(f));
    }
  );
  return posts;
}