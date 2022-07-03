import 'package:crypties_app/Presentation/Screen/NFTCreatorPage/Controller/getNFT.dart';
import 'package:crypties_app/exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CreatorPage extends StatefulWidget {
  OpenseaNFT nft;
  CreatorPage(this.nft);

  @override
  _CreatorPageState createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  List nfts = [];
  bool loaded = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int offset = 0;

  @override
  void initState() {
    initFunc();
    super.initState();
  }

  void initFunc() async {
    print('asdfasdhfsd' + widget.nft.asset_contract['address'].toString());
    nfts = await getCreatorNFTs(widget.nft.asset_contract['address'], 0);
    setState(() {
      loaded = true;
      nfts = nfts;
    });
  }
  void _onLoading() async {
    List<OpenseaNFT> afterPost = await getCreatorNFTs(widget.nft.asset_contract['address'], offset+1);
    nfts = new List.from(nfts)..addAll(afterPost);
    setState(() {
      offset += 1;
      nfts = nfts;
    });
    afterPost = [];
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // settingAppbar(context, widget.nft.collection['name'].toString()),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: appbarTitileProfile(
                    widget.nft.collection['name'].toString(), false)),
            widget.nft.collection['safelist_request_status'] == 'verified'
                ? SizedBox(
                    width: 8,
                  )
                : SizedBox(),
            widget.nft.collection['safelist_request_status'] == 'verified'
                ? Icon(
                    Icons.verified,
                    color: Colors.blue,
                  )
                : SizedBox(),
            SizedBox(
              width: 32,
            )
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 170,
                        child: Stack(
                          children: [
                            Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                widget.nft.collection['banner_image_url'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 32,
                                ),
                                Column(
                                  children: [
                                    Expanded(child: Container()),
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(280.0),
                                      child: Container(
                                        width: 85,
                                        height: 85,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(280.0),
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              child: CachedNetworkImage(
                                                imageUrl: widget
                                                    .nft.asset_contract['image_url']
                                                    .toString(),
                                                progressIndicatorBuilder: (context,
                                                        url, downloadProgress) =>
                                                    Shimmer.fromColors(
                                                        baseColor: ColorsConst.gray,
                                                        highlightColor:
                                                            ColorsConst.whiteGrey,
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          color: Colors.grey,
                                                        )),
                                                errorWidget: (context, url, error) =>
                                                    widget
                                                                .nft
                                                                .creator[
                                                                    'profile_img_url']
                                                                .toString()
                                                                .substring(widget
                                                                        .nft
                                                                        .creator[
                                                                            'profile_img_url']
                                                                        .length -
                                                                    3) ==
                                                            'svg'
                                                        ? SvgPicture.network(
                                                            widget
                                                                .nft
                                                                .creator[
                                                                    'profile_img_url']
                                                                .toString(),
                                                            placeholderBuilder: (BuildContext
                                                                    context) =>
                                                                Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                                .all(
                                                                            30.0),
                                                                    child:
                                                                        const CircularProgressIndicator()),
                                                          )
                                                        : Container(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0,left: 8,top: 8,bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(widget.nft.collection['name'].toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                widget.nft.collection['safelist_request_status'] == 'verified'
                                    ? Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                ),
                                    )
                                    : SizedBox(),
                              ],
                            ),
                            SizedBox(height: 8,),
                            // Text(widget.nft.collection['description']),
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                    ],
                  ),
                ],
              ),
            )
          ];
        },
        body: SmartRefresher(
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("");
                } else if (mode == LoadStatus.loading) {
                  body = CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          ColorsConst.themeColor));
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
            enablePullDown: false,
            enablePullUp: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            // // scrollController: controller,
            // onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: !loaded
                ? nftShimmer()
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 3,
                    itemCount: nfts.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        HapticFeedback.selectionClick();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailNFT(nfts[index])));
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: CachedNetworkImage(
                          imageUrl: nfts[index].image_url.toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  Shimmer.fromColors(
                                      baseColor: ColorsConst.gray,
                                      highlightColor: ColorsConst.whiteGrey,
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        color: Colors.grey,
                                      )),
                          errorWidget: (context, url, error) => nfts[index]
                                      .image_url
                                      .substring(
                                          nfts[index].image_url.length - 3) ==
                                  'svg'
                              ? SvgPicture.network(
                                  nfts[index].image_url,
                                  placeholderBuilder: (BuildContext context) =>
                                      Container(
                                          padding: const EdgeInsets.all(30.0),
                                          child:
                                              const CircularProgressIndicator()),
                                )
                              : Container(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(
                            index == 0
                                ? 2
                                : index % 12 == 0
                                    ? 2
                                    : 1,
                            index == 0
                                ? 2
                                : index % 7 == 0
                                    ? 2
                                    : index % 12 == 0
                                        ? 2
                                        : 1),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  )),
      ),
    );
  }
}
