import 'package:crypties_app/exports.dart';
import 'package:flutter/cupertino.dart';

class EachChatList extends StatefulWidget {
  var userId, index, snapShotData;
  final List chattingPeople;

  EachChatList({ this.userId,  this.index, this.chattingPeople, this.snapShotData});

  @override
  _EachChatListState createState() => _EachChatListState();
}

class _EachChatListState extends State<EachChatList> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: ()async{
        HapticFeedback.selectionClick();

        Map data = await userInfo(widget.userId);
        toRreadModel(widget.chattingPeople[widget.index]['chatId'], FirebaseAuth.instance.currentUser.uid);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Message(
          chatId: widget.chattingPeople[widget.index]['chatId'],
          otherUserId:widget.userId,
          userInfo: UserDomain.fromJson(data),
        )));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 70,
          child:
          FutureBuilder(
            future: userInfo(widget.userId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Map userDataMap = snapshot.data;
              if (snapshot.hasData) {
                return  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (userDataMap['profileNFT']== null || userDataMap['profileNFT'].length < 5)
                        ? profileNFT(userDataMap['profileImage'], 60) :
                    profileNFT(userDataMap['profileNFT'], 60),

                    SizedBox(width: 8,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userDataMap['nickname']}', style: ThemeTextConst.eachPostName,),
                          SizedBox(height: 8,),
                          Text('${widget.chattingPeople[widget.index]['text'].toString()}', style: ThemeTextConst.eachPostScreenName, overflow: TextOverflow.ellipsis,
                            maxLines: 1,)
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${timeDifference(widget.chattingPeople[widget.index]['createdAt'].toDate())}'),
                        Expanded(child: Container()),
                        widget.chattingPeople[widget.index]['isRead'] ? SizedBox() :
                        Row(
                          children: [
                            Container(width: 13,height: 13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),

                                  gradient:GradientConst.themeGradientLine,)),
                          ],
                        ),
                        Expanded(child: Container()),

                      ],
                    )


                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),

        ),
      ),
    );
  }
}
