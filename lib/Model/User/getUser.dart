import 'package:crypties_app/Domain/User/user.dart';
import 'package:crypties_app/exports.dart';

  Future userInfo(userId) async {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
    Map record = docSnapshot.data();
    // UserDomain result = UserDomain.fromJson(record);
    print('userinfo get!!!!!!!!!!');

    return record;
  }

Future entityInfo(userId) async {

  DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('entity')
      .doc('entity')
      .get();
  Map record = docSnapshot.data();
  return record;
}
Future publicMetricsInfo(userId) async {

  DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('publicMetrics')
      .doc('publicMetrics')
      .get();
  Map record = docSnapshot.data();
  return record;
}