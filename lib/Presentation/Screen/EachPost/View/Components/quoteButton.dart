import 'package:crypties_app/exports.dart';
Widget quoteEachPost(postInfo, context){
  int quoteNumber = postInfo['quoteNum'];

  return   LikeButton(
    isLiked: postInfo['isQuoted'],

    onTap: (liked)async{
      HapticFeedback.mediumImpact();

      Navigator.of(context)
          .push(navigateNewPost(
          postInfo:postInfo,
          postedUserInfo:
          postInfo['userInfo'],
          // communityId: widget
          //     .communityId,
          isReply: false,
          isQuote:true));
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
        FontAwesomeIcons.quoteRight,
        color: isLiked ? ColorsConst.purple: Colors.grey,
        size: 16,
      );
    },
    likeCount: quoteNumber,
    countBuilder: (int count, bool isLiked, String text) {
      var color = isLiked ? ColorsConst.purple: Colors.grey;
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