import 'package:crypties_app/exports.dart';


Future postPublicMetrics(postId) async {

  DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('publicMetrics')
      .doc('publicMetrics')
      .get();
  Map record = docSnapshot.data();
  return record;
}