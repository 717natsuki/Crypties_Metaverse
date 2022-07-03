import 'package:crypties_app/exports.dart';

void createMessaggeModel(type, chatGroupName, sender, text, receiver, {String image}) async {
  try{
    // 全体のチャットコレクション
    DocumentReference ref = FirebaseFirestore.instance
        .collection('chats')
        .doc(chatGroupName)
        .collection('talk')
        .doc();
    String documentId = ref.id;
    ref.set({
      'type': type,
      'chatId': chatGroupName,
      'text': text,
      'sender': sender,
      'receiver': receiver,
      'image': image,
      'createdAt': DateTime.now(),
      "imageOpened": false,
      'messageId': documentId,
    });


    //送ってる人のユーザコレクション
    FirebaseFirestore.instance
        .collection('users')
        .doc(sender)
        .collection('chats')
        .doc(chatGroupName)
        .set({
      'type':type,
      'chatId': chatGroupName,
      'text': text,
      'sender': sender,
      'receiver': receiver,
      'createdAt': DateTime.now(),
      'isRead': true,
      'boolDeleted': false,
    }, SetOptions(merge: true));


    //送られる人のユーザコレクション
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiver)
        .collection('chats')
        .doc(chatGroupName)
        .set({
      'type':type,
      'chatId': chatGroupName,
      'text': text,
      'sender': sender,
      'receiver': receiver,
      'createdAt': DateTime.now(),
      'isRead': false,
      'boolDeleted': false,
    }, SetOptions(merge: true));

    // createBadge(receiver, 'chat');
  }catch(e){
    print(e.toString());
  }
}