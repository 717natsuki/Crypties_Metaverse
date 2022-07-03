import 'package:crypties_app/exports.dart';

class Quoted extends StatefulWidget {
  final reactions;

  Quoted(this.reactions);

  @override
  _QuotedState createState() => _QuotedState();
}

class _QuotedState extends State<Quoted> {
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
              FontAwesomeIcons.quoteRight,
              size: 30,
              color: ColorsConst.purple,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(widget.reactions['postInfo']['text'].toString()),
                  notificationMessageLiked(kNotificationString.quote, widget.reactions['userInfo'].nickname.toString(),
                      timeDifference( widget.reactions['createdAt'].toDate()),
                      widget.reactions['userInfo']),
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
