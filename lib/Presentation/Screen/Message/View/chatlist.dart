import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'eachChatList.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool clicked = false;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool isNotificationDisabled = true;
  int showNum = 8;
  int _start = 6;
  int _current = 6;
  bool showPreviousChat = false;
  List chatList = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void initFunc() async {
    // isNotificationDisabled = await Permission.notification.isDenied || await Permission.notification.isPermanentlyDenied;

    setState(() {
      chatList = chatList;
      isNotificationDisabled = isNotificationDisabled;
    });
  }

  @override
  void initState() {
    initFunc();
    super.initState();
  }

  void _onRefresh() async {
    initFunc();
    _refreshController.refreshCompleted();
    HapticFeedback.mediumImpact();

    setState(() {
      clicked = !clicked;
    });
  }

  void _onLoading() async {
    // if (chatList.length >= showNum){
    //   List newChat = await getChatListAfter(showNum, chatList[chatList.length - 1]['createdAt']);
    //   // showNum = showNum + 10;
    //   print(newChat.toString());
    //   chatList.addAll(newChat);
    //   setState(() {
    //     chatList = chatList;
    //     showNum = showNum;
    //   });
    // }

    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: appbarTitile('Message'),
        elevation: 1,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('chats')
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

              final chats = snapshot.data.docs;
              List<Map> chattingPeople = [];
              for (var message in chats) {
                // Map data = await userInfo(message['userId']);

                chattingPeople.add({
                  'text': message["text"],
                  'sender': message["sender"],
                  'isRead': message["isRead"],
                  'receiver': message["receiver"],
                  'createdAt': message["createdAt"],
                  'boolDeleted': message["boolDeleted"],
                  'chatId': message["chatId"],
                  // 'userInfo':UserDomain.fromJson(data) ,
                });
              }

              return Container(
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus mode) {
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
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: chattingPeople.length == 0
                      ? Column(
                          children: [
                            Expanded(child: Container()),
                            Center(
                                child: Text(
                              'No message yet',
                              style: TextStyle(fontWeight: FontWeight.w600,fontFamily: FontConst.fontSemiBoldFamily,),
                            )),
                            Expanded(child: Container()),
                          ],
                        )
                      : ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: FutureBuilder(
                                future: userInfo(
                                    FirebaseAuth.instance.currentUser.uid == chattingPeople[index]['sender']
                                        ? chattingPeople[index]['receiver']
                                        : chattingPeople[index]['sender']),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        // isNotificationDisabled && index == 0
                                        //     ? allowNotification()
                                        //     : SizedBox(),
                                        chattingPeople[index]['boolDeleted']
                                            ? SizedBox()
                                            : EachChatList(
                                                userId:
                                                chattingPeople[index]['sender'] ==
                                                FirebaseAuth.instance.currentUser.uid ?
                                                chattingPeople[index]['receiver']:
                                                chattingPeople[index]['sender'],
                                                index: index,
                                                chattingPeople: chattingPeople,
                                                snapShotData: snapshot.data,
                                              ),
                                        Divider(
                                          height: 1,
                                        )
                                      ],
                                    );
                                  } else {
                                    return Text("　");
                                  }
                                },
                              ),
                            );
                          },
                          itemCount: chattingPeople.length,
                        ),
                ),
              );
            }),
      ),
    );
  }
}
