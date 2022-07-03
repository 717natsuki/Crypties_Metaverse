import 'package:crypties_app/exports.dart';


Future<int> getNumLikesModel(postId, {communityId}) async {
  // analytics('getNumLikesModel', 1);

  if (communityId == null){
    // final QuerySnapshot qSnap = await FirebaseFirestore.instance
    //     .collection('posts')
    //     .doc(postId)
    //     .collection('likes')
    //     .get();
    // final int documents = qSnap.docs.length;


    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .get();
    Map<String, dynamic> record = docSnapshot.data();

    return record['likes'];
  } else {
    // final QuerySnapshot qSnap = await FirebaseFirestore.instance
    //     .collection('communities')
    //     .doc(communityId)
    //     .collection('posts')
    //     .doc(postId)
    //     .collection('likes')
    //     .get();
    // final int documents = qSnap.docs.length;
    // return documents;
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('communities')
        .doc(communityId)
        .collection('posts')
        .doc(postId)
        .get();
    Map<String, dynamic> record = docSnapshot.data();

    return record['likes'];
  }

}