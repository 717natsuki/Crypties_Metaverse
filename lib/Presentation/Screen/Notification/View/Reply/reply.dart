import 'package:crypties_app/Model/Notification/Reaction/getAllReaction.dart';
import 'package:crypties_app/Model/Notification/Reply/getAllReply.dart';
import 'package:crypties_app/Model/Notification/Reply/getReplyAfter.dart';
import 'package:crypties_app/Presentation/Screen/EachNotification/Reaction/followed.dart';
import 'package:crypties_app/Presentation/Screen/EachNotification/Reaction/liked.dart';
import 'package:crypties_app/Presentation/Screen/EachNotification/Reaction/spreaded.dart';
import 'package:crypties_app/Presentation/Screen/EachNotification/Reply/quoted.dart';
import 'package:crypties_app/Presentation/Screen/EachNotification/Reply/replied.dart';
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Reply extends StatefulWidget {
  @override
  _ReplyState createState() => _ReplyState();
}

class _ReplyState extends State<Reply> with AutomaticKeepAliveClientMixin{
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  List allPosts = [];
  List reactions = [];
  String userId;
  bool refreshed = true;

  void _onRefresh() async {
    // deleteBadge('reaction');
    initFunc();
    HapticFeedback.mediumImpact();
    setState(() {
      refreshed = !refreshed;
    });
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    initFunc();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  void initFunc() async {
    // deleteBadge('reaction');
    userId = FirebaseAuth.instance.currentUser.uid;
    reactions = await  getReply() ;
    setState(() {
      reactions = reactions;
      userId = userId;
    });
  }

  void _onLoading() async {
    // もっと投稿を取得してくる
    List afterFollowing = await getReplyAfter(reactions[reactions.length - 1]['createdAt']);
    reactions = new List.from(reactions)..addAll(afterFollowing);
    setState(() {
      reactions = reactions;
    });
    afterFollowing = [];
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("");
            } else if (mode == LoadStatus.loading) {
            } else if (mode == LoadStatus.failed) {
              body = Text("Error");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("");
            } else {
              body = Text(" ");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: buildListView(reactions));
  }

  Widget buildListView(List reactions) {
    return reactions.length < 1
        ? Column(
      children: [
        Expanded(child: Container()),
        Center(
            child: Text(
              'No reply yet. 🌎',
              style: TextStyle(fontWeight: FontWeight.w600, fontFamily: FontConst.fontSemiBoldFamily,),
            )),
        Expanded(child: Container()),
      ],
    )
        : ListView.builder(
//      cacheExtent: 4000,
      itemBuilder: (BuildContext context, int index) {
        return

          Column(
            children: [
              reactions[index]['type'] == 2
                  ? FlatButton(
                  onPressed: (){
                    HapticFeedback.selectionClick();

                  },
                  child: Quoted(reactions[index]))
                  : reactions[index]['type'] == 3
                  ? FlatButton(
                  onPressed: (){
                    HapticFeedback.selectionClick();

                  },
                  child: Replied(reactions[index]))
                  : Text('not here! ${reactions[index]['type']} '),
              Divider(height: 1,)

            ],
          );

      },
      itemCount: reactions.length,
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0,right: 8),
//       child: Column(
//         children: [
//           Followed(),
//           Liked(),
//           Spreaded(),
//         ],
//       ),
//     );
//   }
// }
