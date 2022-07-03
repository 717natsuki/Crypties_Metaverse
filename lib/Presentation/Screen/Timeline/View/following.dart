import 'package:crypties_app/Model/Post/Following/getFollowingAfter.dart';
import 'package:crypties_app/Model/Post/Following/getFollowingPost.dart';
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following>with AutomaticKeepAliveClientMixin {
  List allPost = [];
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  ScrollController controller = ScrollController();
  bool loaded = false;
  bool isNoMoreToShow = false;

  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    initFunc();
    super.initState();
  }
  void initFunc()async{
    allPost = await getFollowingPost();
    setState(() {
      loaded = true;
      allPost = allPost;
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
      List afterPost = await getFollowingAfter(allPost[allPost.length - 1]['createdAt']);
      if (afterPost.isEmpty){
        setState(() {
          isNoMoreToShow = true;
        });
      }
      allPost = new List.from(allPost)..addAll(afterPost);
      setState(() {
        allPost = allPost;
      });
      afterPost = [];
    }

    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return  SmartRefresher(
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
        scrollController: controller,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: !loaded
            ? shimmerPost()
            : ListView.builder(
          controller: controller,
          itemBuilder: (BuildContext context, int index) {

            return allPost[index]['isDeleted'] != null &&
                allPost[index]['isDeleted']
                ? SizedBox()
                : Column(
              children: [
                EachPost(
                  postInfo: allPost[index],
                ),
              ],
            );
          },
          itemCount: allPost.length,
        ));
  }
}

