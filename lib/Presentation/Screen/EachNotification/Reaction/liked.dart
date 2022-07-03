import 'package:crypties_app/exports.dart';

class Liked extends StatefulWidget {
  final reaction;
  Liked(this.reaction);

  @override
  _LikedState createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),

      onPressed: ()async{
        HapticFeedback.selectionClick();

        var postValue = await getEachPostInformation(widget.reaction['postId']);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPost(
                postInfo:postValue,
                // isQuote: true,
              )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.solidHeart,
              size: 30,
              color: ColorsConst.red  ,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  notificationMessageLiked(
                      kNotificationString.like, widget.reaction['userInfo'].nickname.toString(),
                      timeDifference( widget.reaction['createdAt'].toDate()),
                      widget.reaction['userInfo']
                  ),
                  SizedBox(height: 8,),
                  postComponent('${widget.reaction['postInfo']['text']}')
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
