import 'package:crypties_app/exports.dart';
void toRreadModel(chatGroupName, userId) async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('chats')
      .doc(chatGroupName)
      .set({
    'isRead': true,
  }, SetOptions(merge: true));

}
