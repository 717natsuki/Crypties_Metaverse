
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class NFTs extends StatefulWidget {
  @override
  _NFTsState createState() => _NFTsState();
}

class _NFTsState extends State<NFTs> with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool loaded = false;
  List<OpenseaNFT> nfts = [];
  int offset = 0;

  @override
  void initState() {
    initFunc();
    super.initState();
  }

  void initFunc()async{
    nfts = await getAllRecentNFTs(0);
    setState(() {
      loaded = true;
      nfts = nfts;
    });
  }

  void _onRefresh() async {
    HapticFeedback.mediumImpact();
    initFunc();
    _refreshController.refreshCompleted();
  }
  void _onLoading() async {
    List<OpenseaNFT> afterPost = await getAllRecentNFTs(offset+1);
    nfts = new List.from(nfts)..addAll(afterPost);
      setState(() {
        offset += 1;
        nfts = nfts;
      });
      afterPost = [];
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
              ? nftShimmer()
              :  StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            itemCount: nfts.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(

              onTap: (){
                HapticFeedback.selectionClick();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNFT(
                         nfts[index]
                      ))
                );
              },
              child: Container(
                color: Colors.transparent,
                child:
                CachedNetworkImage(
                  imageUrl: nfts[index].image_url.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Shimmer.fromColors(
                          baseColor: ColorsConst.gray,
                          highlightColor: ColorsConst.whiteGrey,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                          )
                      ),
                  errorWidget: (context, url, error) =>
                  nfts[index].image_url.substring(nfts[index].image_url.length - 3) == 'svg' ?
                      SvgPicture.network(
                        nfts[index].image_url,
                        placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator()),
                      ) :
                  Container(),
                  fit: BoxFit.cover,
                ),),
            ),
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(index == 0 ? 2 : index % 12 == 0 ? 2 :1, index == 0 ? 2 :  index % 7 ==0 ? 2 : index % 12 == 0 ? 2 :1),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
          ));
  }
}
  