import 'package:crypties_app/Model/Retweet/createRetweet.dart';
import 'package:crypties_app/exports.dart';
Widget retweetEachPost(postInfo, context){
  int retweetNumber = postInfo['retweetNum'];

  return    LikeButton(
    isLiked: postInfo['isRetweeted'],
    onTap: (liked)async{
      HapticFeedback.mediumImpact();

      if (postInfo['isRetweeted']){
       return liked;
      } else {
        // print(postInfo.toString()+'  ioasdfoisd');
        bool isOk = await okCancelAlert('Spread?','Do you want to spread this post?', 'Spread', 'Cancel', false, context);

        if(isOk){
          createRetweetPost(FirebaseAuth.instance.currentUser.uid, postInfo, postInfo['userInfo']);
          return await !liked;

        }else{
          return await liked;

        }
      }

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
        FontAwesomeIcons.retweet,
        color: isLiked ?ColorsConst.orange: Colors.grey,
        size: 18,
      );
    },
    likeCount: retweetNumber,
    countBuilder: (int count, bool isLiked, String text) {
      var color = isLiked ? ColorsConst.orange : Colors.grey;
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