import 'package:crypties_app/Model/User/Follow/Follower/getAllFollower.dart';
import 'package:crypties_app/Model/User/Follow/Follower/getAllFollowerAfter.dart';
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FollowerPage extends StatefulWidget {
  final userId;
  FollowerPage(this.userId);

  @override
  _FollowerPageState createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage>with AutomaticKeepAliveClientMixin {
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
    posts = await  getAllFollowerModel(widget.userId);
    print(widget.userId.toString());
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
      List afterPost = await  getAllFollowerAfterModel(widget.userId, posts[posts.length - 1]['createdAt']) ;
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
              : posts.length == 0 ? Center(child: Text('No one following!')) :     ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return
                UserImageList(posts[index]['userInfo']);
              // EachPost({postInfo: posts[index]});
            },
            itemCount:posts.length,));
  }
}
