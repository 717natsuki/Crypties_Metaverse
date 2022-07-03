import 'package:crypties_app/exports.dart';

void updateUser(userId, field, value) async {

  try{
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({
      '$field':value,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  } catch (e){
    print(e.toString());
  }


}