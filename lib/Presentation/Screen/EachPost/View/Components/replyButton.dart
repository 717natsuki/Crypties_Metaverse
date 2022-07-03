import 'package:crypties_app/exports.dart';
Widget replyEachPost(postInfo, context){
  int replyNumber = postInfo['replyNum'];

  return  LikeButton(
    isLiked: postInfo['isReplied'],

    onTap: (liked)async{
      HapticFeedback.mediumImpact();

      print(postInfo['userInfo'].screenName.toString());
      Navigator.of(context)
          .push(navigateNewPost(
          postInfo:postInfo,
          postedUserInfo:
          postInfo['userInfo'],
          // communityId: widget
          //     .communityId,
          isReply: true,
          isQuote:false));

      return await !liked;

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
        FontAwesomeIcons.reply,
        color: isLiked ? ColorsConst.lightBlue: Colors.grey,
        size: 18,
      );
    },
    likeCount: replyNumber,
    countBuilder: (int count, bool isLiked, String text) {
      var color = isLiked ? ColorsConst.lightBlue : Colors.grey;
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