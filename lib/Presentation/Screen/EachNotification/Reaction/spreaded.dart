import 'package:crypties_app/exports.dart';

class Spreaded extends StatefulWidget {
  final reaction;
  Spreaded(this.reaction);

  @override
  _SpreadedState createState() => _SpreadedState();
}

class _SpreadedState extends State<Spreaded> {
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
              FontAwesomeIcons.retweet,
              size: 30,
              color: ColorsConst.orange,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  notificationMessageLiked(kNotificationString.spread, widget.reaction['userInfo'].nickname,
                      timeDifference(widget.reaction['postInfo']['createdAt'].toDate()),
                      widget.reaction['userInfo']
                  ),
                  SizedBox(height: 8,),
                  postComponent('${widget.reaction['previousPost']['text'].toString()}')
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
