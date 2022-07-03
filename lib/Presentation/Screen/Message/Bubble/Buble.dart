// import 'package:studentsns/Call/Controller/DM/dm.dart';


import 'package:crypties_app/Presentation/Screen/EachPost/View/ImageView.dart';
import 'package:crypties_app/Presentation/Screen/Message/Bubble/types/screenshot.dart';
import 'package:crypties_app/exports.dart';
class Bubble extends StatefulWidget {
  final user1, user2, image, messageInfo;
  Bubble({this.user1, this.user2, this.image, this.messageInfo});


  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  CrossAxisAlignment whereBubble;
  BorderRadius border;
  Color color;
  String myNickname = ' ';

  Color someFunc0() {
    if (!widget.messageInfo['isMyMessage'])
      color = ColorsConst.blue;
    else
      color = ColorsConst.red ;
    return color;
  }

  CrossAxisAlignment someFunc1() {
    if (!widget.messageInfo['isMyMessage'])
      whereBubble = CrossAxisAlignment.start;
    else
      whereBubble = CrossAxisAlignment.end;
    return whereBubble;
  }

  BorderRadius someFunc() {
    if (widget.messageInfo['isMyMessage']) {
      border = BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),

      );
      whereBubble = CrossAxisAlignment.start;
    } else {
      border = BorderRadius.only(
        bottomLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      );
      whereBubble = CrossAxisAlignment.end;
    }
    return border;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.messageInfo['type'] == 6) {
      return InformationBubble(messageContent: 'Image screenshot');
    } else {
      return widget.messageInfo['type'] == 8 ?
      InformationBubble(messageContent: '画像が閲覧されました'):
      Padding(
      padding: EdgeInsets.only(
        top: 0.0,
        bottom: 0,
        left: widget.messageInfo['isMyMessage'] ? 50 : 5,
        right: widget.messageInfo['isMyMessage'] == false ? 10 : 5,
      ),
      child: Column(
        crossAxisAlignment: someFunc1(),
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              widget.messageInfo['isMyMessage']
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () {
                        HapticFeedback.selectionClick();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(
                                    userId: widget.user1 ==
                                            FirebaseAuth
                                                .instance.currentUser.uid
                                        ? widget.user2
                                        : widget.user1,
                                  )),
                        );
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(280.0),
                          child: Container(
                            height: 30,
                            width: 30,
                            child: CachedNetworkImage(
                              imageUrl: widget.image,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Padding(
                                padding: const EdgeInsets.all(48.0),
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
//                              fit: BoxFit.fitHeight,
                            ),
                          )),
                    ),
              widget.messageInfo['isMyMessage'] == true
                  ? Expanded(child: Container())
                  : SizedBox(
                      width: 8,
                    ),

                   Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        widget.messageInfo['isMyMessage']
                            ? timeChatted(widget.messageInfo['createdAt'] ,widget.messageInfo['type'])
                            : SizedBox(),
                        widget.messageInfo['type'] == 7 ?
                        Icon(FontAwesomeIcons.solidHeart,color: Color(0xffF77576),size: 70,) :
                       widget.messageInfo['type'] == 4
                                    ?

                        //自分が送った写真か？
                                    widget.messageInfo['isMyMessage']
                                        ? GestureDetector(
                                            onTap: () {
                                              HapticFeedback.selectionClick();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => ImageViewPage(
                                                      url: widget.messageInfo['image'],
                                                    )),
                                              );
                                              // Navigator.of(context).push(navigateImagge(
                                              //   widget.messageInfo['image'], widget.messageInfo['chatId'], widget.user1, widget.user2,
                                              // ));
                                            },
                                            child: Container(
                                                width: 190,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius: someFunc(),

                                                  color: Colors.transparent,
                                                ),
                                                child:ClipRRect(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl:  widget.messageInfo['image'],
                                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                        Padding(
                                                          padding: const EdgeInsets.all(48.0),
                                                          child:
                                                          CircularProgressIndicator(value: downloadProgress.progress),
                                                        ),
                                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                              ),
                                          )
                                        : widget.messageInfo['imageOpened'] != null && widget.messageInfo['imageOpened']
                                            ?
                                            // すでに開いたパターン
                                    GestureDetector(
                                      onTap: (){
                                        HapticFeedback.selectionClick();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ImageViewPage(
                                                url: widget.messageInfo['image'],
                                              )),
                                        );
                                      },
                                      child: Container(
                                        width: 190,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: someFunc(),

                                          color: Colors.transparent,
                                        ),
                                        child:ClipRRect(
                                          borderRadius: BorderRadius.circular(30.0),
                                          child: CachedNetworkImage(
                                            imageUrl:  widget.messageInfo['image'],
                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                Padding(
                                                  padding: const EdgeInsets.all(48.0),
                                                  child:
                                                  CircularProgressIndicator(value: downloadProgress.progress),
                                                ),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                      ),
                                    )
                                            :
                                            // まだ開かれてない
                                            GestureDetector(
                                                onTap: () {
                                                  HapticFeedback.selectionClick();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ImageViewPage(
                                                          url: widget.messageInfo['image'],
                                                        )),
                                                  );                                                //
                                                //   createMessaggeModel(8, widget.messageInfo['chatId'], FirebaseAuth.instance.currentUser.uid, '画像を閲覧しました', widget.user1 == FirebaseAuth.instance.currentUser.uid ? widget.user2 :widget.user1);
                                                //   // FirebaseDatabase.instance.reference()
                                                //   //     .child("messages")
                                                //   //     .child(widget.messageInfo['chatId'])
                                                //   //     .child(widget.messageInfo['messageIdV2'])
                                                //   //     .update({'imageOpened': true});
                                                //   opendImage(
                                                //       widget.messageInfo[
                                                //       'chatId'],
                                                //       widget.messageInfo[
                                                //       'messageId']);
                                                // Navigator.of(context).push(navigateImagge(
                                                //   widget.messageInfo['image'], widget.messageInfo['chatId'], widget.user1, widget.user2,
                                                // ));
                                                },
                                                child: Container(
                                                  width: 190,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius: someFunc(),

                                                    color: Colors.transparent,
                                                  ),
                                                  child:ClipRRect(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    child: CachedNetworkImage(
                                                      imageUrl:  widget.messageInfo['image'],
                                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                          Padding(
                                                            padding: const EdgeInsets.all(48.0),
                                                            child:
                                                            CircularProgressIndicator(value: downloadProgress.progress),
                                                          ),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),

                                                ),
                                              )

                                    : ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                130),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.1)),
                                            borderRadius: someFunc(),
                                          ),
                                          child: GestureDetector(
                                            onLongPress: () {
                                              Clipboard.setData(
                                                      new ClipboardData(
                                                          text: widget
                                                                  .messageInfo[
                                                              'messageText']))
                                                  .then((_) {
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Message copied")));
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: someFunc(),
                                                  gradient: widget.messageInfo['isMyMessage'] ? GradientConst.themeGradientLine :null
                                              ),
                                              child: Material(
                                                  borderRadius: someFunc(),
                                                  color: widget.messageInfo['isMyMessage'] ? Colors.transparent : ColorsConst.whiteGrey,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16.0,
                                                            left: 16.0,
                                                            top: 8,
                                                            bottom: 8),
                                                    child: Text(
                                                      widget.messageInfo[
                                                          'messageText'],
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: 'Robonto',
                                                          color: !widget
                                                                      .messageInfo[
                                                                  'isMyMessage']
                                                              ? Colors.black
                                                              : Colors.white),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                        !widget.messageInfo['isMyMessage']
                            ? timeChatted(widget.messageInfo['createdAt'] ,widget.messageInfo['type'])
                            : SizedBox(),
                      ],
                    ),
            ],
          ),
          Row(
            children: [
              widget.messageInfo['isMyMessage']
                  ? Expanded(child: Container())
                  : SizedBox(),
              widget.messageInfo['isMyMessage']
                  ? SizedBox()
                  : Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
    }
  }
}

Widget timeChatted(messageCreatedAt, type) {
  return type == 7 ? SizedBox() : Padding(
    padding: const EdgeInsets.only(right: 4.0, left: 4),
    child: Text(
      messageCreatedAt
          .minute
          .toString()
          .length
          .toString() ==
          1.toString()
          ? '${messageCreatedAt.hour}:0${messageCreatedAt.minute}'
          : '${messageCreatedAt.hour}:${messageCreatedAt.minute}',
      style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
  );
}