import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailPostSpreads extends StatefulWidget {
  final postId;
  DetailPostSpreads(this.postId);

  @override
  _DetailPostSpreadsState createState() => _DetailPostSpreadsState();
}

class _DetailPostSpreadsState extends State<DetailPostSpreads> with AutomaticKeepAliveClientMixin{
  List posts = [];
  List allPost = [];
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  ScrollController controller = ScrollController();
  bool loaded = false;
  bool isNoMoreToShow = false;

  @override
  void initState() {
    initFunc();
    super.initState();
  }
  void initFunc()async{
    posts = await  getAllRetweetsModel(widget.postId);
    print(posts.toString());
    setState(() {
      loaded =true;
      posts =posts;
    });
  }
  void _onRefresh() async {
    HapticFeedback.mediumImpact();
    initFunc();
    _refreshController.refreshCompleted();
  }
  void _onLoading() async {
    print('loading !!!!!!!!!!!!!!!!!');
    if (!isNoMoreToShow){
      List afterPost = await  getAllRetweetAfterModel(widget.postId, posts[posts.length - 1]['createdAt']) ;
      if (afterPost.length< 2){
        setState(() {
          isNoMoreToShow = true;
        });
      }
      posts = new List.from(posts)..addAll(afterPost);
      setState(() {
        posts = posts;
      });
      afterPost = [];
    }

    _refreshController.loadComplete();
  }



  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return
      SmartRefresher(
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("");
              } else if (mode == LoadStatus.loading) {
                body = CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(ColorsConst.themeColor));
              } else if (mode == LoadStatus.failed) {
                body = Text("Error");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("");
              } else {
                body = Text("No more data");
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
          // scrollController: controller,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: !loaded
              ? shimmerPost()
              :   posts.length < 1 ? noReactionComponent() : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return
                UserImageList(posts[index]['userInfo']);

              // EachPost({postInfo: posts[index]});
            },
            itemCount:posts.length,));


  }
}
