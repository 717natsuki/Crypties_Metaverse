import 'package:crypties_app/exports.dart';

void createBlock(myId, userId) async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(myId)
      .collection('blocks')
      .doc(userId)
      .set({
    "userId": userId,
    "myId": myId,
    "createdAt": DateTime.now(),
  });
}
