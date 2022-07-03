import 'package:crypties_app/Model/Like/getAllLikes.dart';
import 'package:crypties_app/Model/Like/getAllLikesAfter.dart';
import 'package:crypties_app/Model/Quote/getAllQuotes.dart';
import 'package:crypties_app/Model/Quote/getAllQuotesAfter.dart';
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class QuotedPostsScreen extends StatefulWidget {
  final postId, userInfo;

  QuotedPostsScreen({this.postId, this.userInfo});


  @override
  _QuotedPostsScreenState createState() => _QuotedPostsScreenState();
}

class _QuotedPostsScreenState extends State<QuotedPostsScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List quotedPosts = [];
  ScrollController controller = ScrollController();
  bool isEnd = false;

  @override
  void initState() {
    initFunc();
    super.initState();
  }
  void initFunc()async{
    quotedPosts = await getAllQuotesModel(widget.postId);
    print('sdiojfisod ${widget.postId} ${quotedPosts.length}');
    setState(() {
      quotedPosts = quotedPosts;
    });
  }

  void _onRefresh() async {
    // initFunc();
    HapticFeedback.mediumImpact();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    if(!isEnd){
      print('loading~!!!!!!');
      // もっと投稿を取得してくる
      List afterFollowing = await getAllQuotesAfterModel(widget.postId, quotedPosts[quotedPosts.length - 1]['createdAt']);
      quotedPosts = new List.from(quotedPosts)..addAll(afterFollowing);
      setState(() {
        quotedPosts = quotedPosts;
      });
      if (afterFollowing.length < 2){
        setState(() {
          isEnd = true;
        });
      }
      afterFollowing = [];
    }

    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppbar(context, 'Quoted posts'),
        body: quotedPosts.toString() == [].toString() ? Center(child: Text('No quotes yet.',style: TextStyle(fontWeight: FontWeight.w600)),):
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
            // controller: controller,
            itemBuilder: (BuildContext context, int index) {

              return quotedPosts[index]['isDeleted'] != null &&
                  quotedPosts[index]['isDeleted']
                  ? SizedBox()
                  : Column(
                children: [
                  EachPost(
                    postInfo: quotedPosts[index],
                  ),
                ],
              );
            },
            itemCount: quotedPosts.length,
          )
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