import 'package:crypties_app/Model/Chat/createMessage.dart';
import 'package:crypties_app/Presentation/Screen/Message/Bubble/Buble.dart';
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Message extends StatefulWidget {
  final chatId, otherUserId, userInfo;
  Message({this.chatId, this.otherUserId, this.userInfo});

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final messageTextController = TextEditingController();
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var message;
  var masterIsTrue = false;
  bool isMuted = false;
  int showNum = 14;
  // String userId;
  bool isdmCallOk = true;
  bool isOtherPersonMuted = false;
  bool isSendHeartOk = true;
  DateTime beforeDate = DateTime.now();
  bool isBlocking = false;
  bool isOtherBlocking = false;
  bool isLoading = true;

  void initFunc() async {
    // userId = FirebaseAuth.instance.currentUser.uid;
    // isOtherBlocking =await isBlockingMe(widget.otherUserId, userId );
    // isBlocking = await isBlockingMe( userId, widget.otherUserId,);
    setState(() {
      isOtherBlocking = isOtherBlocking;
      isBlocking = isBlocking;
      isdmCallOk = isdmCallOk;
    });
    setState(() {
      isLoading = false;
    });
//    await Future.delayed(Duration(milliseconds: 210));


//
//    DocumentSnapshot docSnapshot = await Firestore.instance
//        .collection('users')
//        .document(widget.anotherPersonHashId)
//        .collection('talk')
//        .document(widget.chat_Title_Id)
//        .get();
//    Map record = docSnapshot.data;
//    try {
//      isOtherPersonMuted = await record['isMuted'];
//      if (isOtherPersonMuted == null) isOtherPersonMuted = false;
//      setState(() {
//        isOtherPersonMuted = isOtherPersonMuted;
//      });
//    } catch (e){
//      isOtherPersonMuted = false;
//    }
//
//    DocumentSnapshot docSnapshotMy = await Firestore.instance
//        .collection('users')
//        .document(loggedInUser.uid)
//        .collection('talk')
//        .document(widget.chat_Title_Id)
//        .get();
//    Map recordMy = docSnapshotMy.data;
//    try {
//      isMuted = await recordMy['isMuted'];
//      print(isMuted.toString() +'asdfaaaa');
//      if (isMuted == null) isMuted = false;
//      setState(() {
//        isMuted = isMuted;
//      });
//    } catch (e){
//      isOtherPersonMuted = false;
//    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    initFunc();
    super.initState();
  }

  void _onLoading() async {
    showNum = showNum + 10;
    setState(() {
      showNum = showNum;
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return
      isLoading ? Material(
        color: Colors.white,
        // type: MaterialType.transparency,
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                    valueColor:
                    new AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor)),
              ],
            ),
          ),
        ),
      ) :
      Scaffold(
        key: _scaffoldKey,
        endDrawer: true
            ? null
            : Drawer(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: ListTile(
                  leading: Icon(!isMuted
                      ? FontAwesomeIcons.bell
                      : FontAwesomeIcons.bellSlash),
                  title: Text(isMuted ? '通知OFF' : '通知ON'),
                  onTap: () {
//                  _firestore
//                      .collection('users')
//                      .document(loggedInUser.uid)
//                      .collection('talk')
//                      .document(widget.chat_Title_Id)
//                      .updateData({
//                    'isMuted': !isMuted
//                  });
//                  print(isMuted.toString() + 'isMuted');
//
//                  setState(() {
//                    isMuted = !isMuted;
//                  });
                  },
                ),
              ),
            ],
          ),
        ),
        appBar:settingAppbar(context,  widget.userInfo.nickname),
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: Center(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("chats")
                        .doc('${widget.chatId}')
                        .collection('talk')
                        .orderBy('createdAt', descending: true)
                        .limit(showNum)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                        );
                      }

                      final messages = snapshot.data.docs;

                      List<Widget> messageWidgets = [];
                      for (var message in messages) {
                        if (message["text"] != null) {
                          Map messageInfo = {};
                          bool isMyMessage = false;

                          if (message["sender"] == FirebaseAuth.instance.currentUser.uid) {
                            isMyMessage = true;
                          } else {
                            isMyMessage = false;
                          }

                          messageInfo['messageText'] = message["text"].toString();
                          messageInfo['messageSender'] = message["sender"];
                          messageInfo['createdAt'] = message["createdAt"].toDate();
                          messageInfo['type'] = message["type"];
                          messageInfo['chatId'] = widget.chatId;
                          messageInfo['isMyMessage'] = isMyMessage;
                          messageInfo['image'] = message["image"];
                          messageInfo['imageOpened'] = message["imageOpened"];
                          messageInfo['messageId'] = message["messageId"];


                          DateTime d = message['createdAt'].toDate();
                          // if (flag){
                          if (beforeDate != null && beforeDate.day != d.day && messageWidgets.isNotEmpty){
                            messageWidgets.add(Center(child: Padding(
                              padding: const EdgeInsets.only(top: 12.0,bottom: 8),
                              child: Text(
                                // beforeDate.day.toString() + '      ' + d.day.toString(),
                                DateTime(beforeDate.year, beforeDate.month, beforeDate.day) == DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day) ?
                                "Today" :
                                DateTime(d.year, d.month, d.day) == DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1) ?
                                "Yesterday" :
                                "${beforeDate.day}/${beforeDate.month}/${beforeDate.year}",
                                style:  TextStyle(fontSize: 13, color: Colors.grey),),
                            )));
                            // beforeDate = message.data()['createdAt'].toDate();
                          }
                          // new Future.delayed(new Duration(seconds: 3));
                          final messageWidget = Bubble(
                            user1: widget.otherUserId,
                            user2: FirebaseAuth.instance.currentUser.uid,
                            image:
                            ( widget.userInfo.profileNFT == null ||  widget.userInfo.profileNFT.length < 5)
                                ? widget.userInfo.profileImage :
                            widget.userInfo.profileNFT,
                            messageInfo: messageInfo,
                          );


                          messageWidgets.add(messageWidget);
                          beforeDate = message['createdAt'].toDate();
                        }
                      }
                      return messageWidgets.isEmpty
                          ? Expanded(
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(48.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: ColorsConst.gray, fontFamily: 'MPLUSRounded1c-medium',
                                      ),
                                    ),
                                  ],
                                ),
                              )))
                          : Expanded(
                        child: GestureDetector(
                          onTap: () {
                            HapticFeedback.selectionClick();

                            FocusScope.of(context).unfocus();
                          },
                          child: SmartRefresher(
                              enablePullDown: false,
                              enablePullUp: true,
                              footer: CustomFooter(
                                builder:
                                    (BuildContext context, LoadStatus mode) {
                                  Widget body;
                                  if (mode == LoadStatus.idle) {
                                    body = Text(" ");
                                  } else if (mode == LoadStatus.loading) {
                                  } else if (mode == LoadStatus.failed) {
                                    body = Text("エラー発生");
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = Text(" ");
                                  } else {
                                    body = Text(" ");
                                  }
                                  return Container(
                                    height: 55.0,
                                    child: Center(child: body),
                                  );
                                },
                              ),
                              header: WaterDropMaterialHeader(),
                              controller: _refreshController,
                              onLoading: _onLoading,
                              child: ListView(
                                cacheExtent: 5000,
                                reverse: true,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                children: messageWidgets,
                              )),
                        ),
                      );
                    },
                  ),
                  isBlocking ? BlockingContainer('あなたはこのユーザーをブロックしています💦') :
                  isOtherBlocking ? BlockingContainer('このユーザーはあなたをブロックしています💦') :
                  SizedBox(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0.0, top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Container(
                              width: 40,
                              child: FlatButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.all(0),
                                onPressed: () async {
                                  HapticFeedback.selectionClick();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  //
                                  File imageFile = await getImageChat(context );
                                  print(imageFile.toString() + '  aisdfjoisdjfis');
                                  if (imageFile != null) {
                                    String image = await uploadPicChat(
                                        imageFile, widget.chatId);
                                    print(image.toString());

                                    createMessaggeModel(4, widget.chatId, FirebaseAuth.instance.currentUser.uid,
                                        'Image', widget.otherUserId,
                                        image: image.toString());
                                  }
                                },

                                child: Container(
                                  child: Center(child: Icon(FontAwesomeIcons.image)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Container(
                              width: 40,
                              child: FlatButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  child: Center(child:
                                  isSendHeartOk ? Icon(FontAwesomeIcons.heart) :
                                  Icon(FontAwesomeIcons.solidHeart,color: Color(0xffF77576),)
                                  )
                                  ,
                                ),
                                onPressed: ()async{
                                  if (isSendHeartOk){
                                    setState(() {
                                      isSendHeartOk = false;
                                    });
                                    HapticFeedback.selectionClick();
                                    createMessaggeModel(7, widget.chatId, FirebaseAuth.instance.currentUser.uid,
                                      '♡', widget.otherUserId,);

                                    await new Future.delayed(new Duration(seconds: 3));
                                    setState(() {
                                      isSendHeartOk = true;
                                    });
                                  }
                                },

                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
//                        height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 0, top: 0.0, bottom: 6, left: 0),
                                child: TextField(
                                  minLines:
                                  1,
                                  maxLines: 6,
                                  textInputAction: TextInputAction.newline,
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                                  controller: messageTextController,
                                  onChanged: (value) {
                                    message = value;
                                    setState(() {
                                      message = message;
                                    });
                                  },
                                  decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(23.0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(35.0),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 18.0),
                                    hintText: 'Start a message',
//                            border: InputBorder.none,
                                    hintStyle: new TextStyle(
                                        color: Colors.grey.withOpacity(0.7)),
                                    filled: true,
//                            hintText: "Type in your text",
                                    fillColor: Color(0xffF2F3F7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0,right: 2),
                            child: Container(
                              width:35,
                              child: FlatButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    if (message != '') {
                                      HapticFeedback.mediumImpact();
                                      //Implement send functionality.
                                      createMessaggeModel(
                                          1,
                                          widget.chatId,
                                          FirebaseAuth.instance.currentUser.uid,
                                          message,
                                          widget.otherUserId);
                                      messageTextController.clear();
                                      setState(() {
                                        message = '';
                                      });
                                    }
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.send,
                                      size: 27,
                                      color:
                                      message == null || message == ''
                                          ? Colors.grey
                                          : Colors.blue,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

Widget BlockingContainer(message) {
  return Container(
    color: Colors.white,
    child: Center(child: Text(message)),
    height: 60,
  );
}

const kMessageContainerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border(
    top: BorderSide(color: Color(0xffF2F3F7), width: 1.0),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'メッセージを入力してください...',
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.black));
