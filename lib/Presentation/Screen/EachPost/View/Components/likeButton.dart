import 'package:crypties_app/Model/Like/checkIfExisit.dart';
import 'package:crypties_app/Model/Like/createLikeModel.dart';
import 'package:crypties_app/Model/Like/destroyLikeModel.dart';
import 'package:crypties_app/exports.dart';
Widget likeEachPost(postInfo, context) {
  int likeNumber = postInfo['likeNum'];

  return LikeButton(
    isLiked: postInfo['isLiked'],
    onTap: (liked)async{
      HapticFeedback.mediumImpact();

      if (liked){
        likeNumber -= 1;
       destroyLikeModel(FirebaseAuth.instance.currentUser.uid, postInfo['postId'], postInfo['userId']);
      } else {
        createLikeModel(FirebaseAuth.instance.currentUser.uid, postInfo['postId'], postInfo['userId']);
      }
      return !liked;
    },
    size: 24,
    circleColor:
    CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
    bubblesColor: BubblesColor(
      dotPrimaryColor: Color(0xff33b5e5),
      dotSecondaryColor: Color(0xff0099cc),
    ),
    likeBuilder: (bool isLiked) {
      return Icon(
        isLiked ? FontAwesomeIcons.solidHeart :  FontAwesomeIcons.heart,
        color: isLiked ? Colors.red : Colors.grey,
        size: 18,
      );
    },
    likeCount: likeNumber,
    countBuilder: (int count, bool isLiked, String text) {
      var color = isLiked ? Colors.red : Colors.grey;
      Widget result;
      if (count == 0) {
        result = SizedBox();
      } else
        result = Text(
          text,
          style: TextStyle(color: color),
        );
      return result;
    },
  );
}
