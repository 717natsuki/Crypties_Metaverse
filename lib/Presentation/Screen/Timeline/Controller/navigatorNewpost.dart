import 'package:crypties_app/exports.dart';

Route navigateNewPost({postInfo, postedUserInfo, communityId, communityData, letterReceiverUid, isRetweet, isReply, isQuote}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => NewPost(
        postInfo: postInfo,
        postedUserInfo: postedUserInfo,
        communityId: communityId,
        communityData:communityData,
        letterReceiverUid:letterReceiverUid,
        isRetweet:isRetweet,
        isReply:isReply,
      isQuote:isQuote,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
