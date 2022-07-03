import 'package:crypties_app/exports.dart';

class Replied extends StatefulWidget {
  final reactions;

  Replied(this.reactions);

  @override
  _RepliedState createState() => _RepliedState();
}

class _RepliedState extends State<Replied> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      onPressed: ()async{
        HapticFeedback.selectionClick();

        var postValue = await getEachPostInformation(widget.reactions['postId']);
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
              FontAwesomeIcons.comment,
              size: 30,
              color: ColorsConst.lightBlue,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  notificationMessageLiked(kNotificationString.reply, widget.reactions['userInfo'].nickname.toString(),
                  timeDifference( widget.reactions['createdAt'].toDate()),widget.reactions['userInfo']),
                  SizedBox(height: 8,),
                  Text(widget.reactions['postInfo']['text'].toString()),
                  SizedBox(height: 8,),
                  postComponent(widget.reactions['previousPost']['text'].toString())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
