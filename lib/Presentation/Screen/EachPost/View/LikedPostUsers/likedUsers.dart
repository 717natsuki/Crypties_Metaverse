import 'package:crypties_app/Model/Like/getAllLikes.dart';
import 'package:crypties_app/Model/Like/getAllLikesAfter.dart';
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LikedUsers extends StatefulWidget {
  final postId;

  LikedUsers({this.postId});


  @override
  _LikedUsersState createState() => _LikedUsersState();
}

class _LikedUsersState extends State<LikedUsers> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List likes = [];

  @override
  void initState() {
    initFunc();
    super.initState();
  }
  void initFunc()async{
    likes = await getAllLikesModel(widget.postId);
    setState(() {
      likes = likes;
    });
  }

  void _onRefresh() async {
    initFunc();
    HapticFeedback.mediumImpact();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // もっと投稿を取得してくる
    List afterFollowing = await getAllLikesAfterModel(widget.postId, likes[likes.length - 1]['createdAt']);
    likes = new List.from(likes)..addAll(afterFollowing);
    setState(() {
      likes = likes;
    });
    afterFollowing = [];
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:settingAppbar(context, 'Liked users'),
        body: likes.toString() == [].toString() ? Center(child: Text('You can be the first person to like this post 🤗',style: TextStyle(fontWeight: FontWeight.w600)),):
        SmartRefresher(
          footer: CustomFooter(
            builder: (BuildContext context,LoadStatus mode){
              Widget body ;
              if(mode==LoadStatus.idle){
                body =  Text("");
              }
              else if(mode==LoadStatus.loading){
              }
              else if(mode == LoadStatus.failed){
                body = Text("Error");
              }
              else if(mode == LoadStatus.canLoading){
                body = Text("");
              }
              else{
                body = Text("No more data");
              }
              return Container(
                height: 55.0,
                child: Center(child:body),
              );
            },
          ),
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropMaterialHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            cacheExtent: 4000,
            itemBuilder: (BuildContext context, int index) {
              return
                FutureBuilder(
                  future: userInfo(likes[index]['userId']),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          HapticFeedback.selectionClick();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile(
                                    userId:  snapshot.data['userId'],
                                  ))
                          );

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 16.0, left: 16, top: 8, bottom: 8),
                          child: Row(
                            children: [
                              ( snapshot.data['profileNFT'] == null ||  snapshot.data['profileNFT'].length < 5)
                                  ? profileNFT( snapshot.data['profileImage'], 60) :
                              profileNFT( snapshot.data['profileNFT'], 60),

                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                  width: 140,
                                  child: Text(snapshot.data['nickname'],
                                    maxLines: 2,)
                              ),
                              Expanded(child: Container()),
//                              FirebaseAuth.instance.currentUser.uid == snapshot.data['userId'] ? SizedBox():
//                              isFollowing
//                                  ? followButton(
//                                  FirebaseAuth.instance.currentUser.uid,
//                                  snapshot.data['userId'])
//                                  : followButton(
//                                  FirebaseAuth.instance.currentUser.uid,
//                                  snapshot.data['userId']),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Text("");
                    }
                  },
                );

            },
            itemCount: likes.length,
          ),
        ));
  }




}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: settingAppbar(context, 'Liked users'),
//         body: Container());
//   }
// }
//