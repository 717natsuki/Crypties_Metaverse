
import 'package:crypties_app/Domain/NFT/MoralisNFT.dart';
import 'package:crypties_app/Utility/getNFTCount.dart';
import 'package:crypties_app/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Template/nftBadge.dart';
import 'myNFTsTab.dart';
import 'myPosts.dart';
class Profile extends StatefulWidget {
  final userId;
  Profile({this.userId});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isMe = true;
  List allPost = [];
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  bool loaded = false;
  bool isNoMoreToShow = false;
  UserDomain userData;
  PublicMetrics userPublicMetrics;
  Entity userEntity;
  bool isFollowing = false;
  bool loadedPosts = false;
  int countNFT = 0;
  List<OpenseaNFT> openseaNFT = [];

  @override
  void initState() {
    // getNFTCount();
    initFunc();
    super.initState();
  }
  Future initFunc() async {
    setState(() {
      isNoMoreToShow = false;
    });
    if (widget.userId != null && widget.userId != FirebaseAuth.instance.currentUser.uid ){
      setState(() {
        isMe = false;
      });
    }
    if (!isMe){
      Map userd = await userInfo(widget.userId);
      Map userp = await publicMetricsInfo(widget.userId);
      Map userE = await entityInfo(widget.userId);
      isFollowing = await isFollowingUser(FirebaseAuth.instance.currentUser.uid, widget.userId);
      userData = UserDomain.fromJson(userd);
      userPublicMetrics = PublicMetrics.fromJson(userp);
      userEntity = Entity.fromJson(userE);
      setState(() {
        isFollowing = isFollowing;
        userData = userData;
        userPublicMetrics = userPublicMetrics;
        userEntity = userEntity;
        loaded = true;
      });
      allPost = [];
      allPost = await getMyPost(widget.userId);

    } else {
      setState(() {
        loaded = true;
      });
      allPost = await getMyPost(FirebaseAuth.instance.currentUser.uid);
    }

    setState(() {
      allPost = allPost;
      loadedPosts = true;
    });

    if (!isMe){
      if(userEntity.walletAddress!= null){
        openseaNFT = await getNFTOwened(userEntity.walletAddress);

      }
     // List fromMoralisFunc = await getNFTCount(userEntity.walletAddress);
     // countNFT = fromMoralisFunc[0];
     // moralisNft = fromMoralisFunc[1];

    } else{
     Entity userE =  Provider.of<Entity>(context, listen: false);
     if(userE.walletAddress!= null){
       openseaNFT = await getNFTOwened(userE.walletAddress);
     }
     // List fromMoralisFunc =  await getNFTCount(userE.walletAddress);
     // print(fromMoralisFunc[0].toString()+' jasdoifsiod');
     // countNFT = fromMoralisFunc[0];
     // moralisNft = fromMoralisFunc[1];

    }

    setState(() {
      countNFT = countNFT;
      openseaNFT = openseaNFT;
    });
    return 'asdfjasiodf';
  }
  void _onRefresh() async {
    HapticFeedback.mediumImpact();
   var something = await initFunc();

   if(something != null){
     _refreshController.refreshCompleted();
   }
  }
  void _onLoading() async {
    print('loading !!!!!!!!!!!!!!!!!');
    if (!isNoMoreToShow){
      List afterPost = [];

      if (!isMe){
        afterPost = await getMyPostAfter(allPost[allPost.length - 1]['createdAt'], widget.userId);
      } else {
        afterPost = await getMyPostAfter(allPost[allPost.length - 1]['createdAt'], FirebaseAuth.instance.currentUser.uid);
      }
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
    final UserDomain providerUser = Provider.of<UserDomain>(context);
    final PublicMetrics providerPublic = Provider.of<PublicMetrics>(context);
    final Entity providerEntity = Provider.of<Entity>(context);

    return !loaded ?  Material(
      // type: MaterialType.transparency,
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                  valueColor:
                  new AlwaysStoppedAnimation<Color>(
                      ColorsConst.blue)),
            ],
          ),
        ),
      ),
    )  : Scaffold(
      backgroundColor: Colors.white,
      appBar: profileAppbar(context, isMe, !isMe ? userData.screenName.toString() :
        providerUser.screenName.toString(), widget.userId != null,
          !isMe ? userEntity.isVerified :
          providerEntity.isVerified,
          widget.userId

      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        heroTag: "hero3",
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: GradientConst.themeGradientLine
          ),
          child: Icon(
            FontAwesomeIcons.pen,
            size: 20,
          ),
        ),
        backgroundColor: Color(0xff7597FD),
        onPressed: () {
          HapticFeedback.selectionClick();

          Navigator.of(context).push(navigateNewPost());
        },
      ),
      body:  DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0, left: 13),
                      child: Container(
                        width: double.maxFinite,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height:110,
                                    width: 110,
                                    child: Stack(
                                      children: [
                                        Container(child:  (isMe) ? (providerUser.profileNFT == null ||providerUser.profileNFT.length < 5)
                                            ? profileNFT(providerUser.profileImage, 110) :
                                        profileNFT(providerUser.profileNFT, 110)

                                            : (!isMe) ? (userData.profileNFT == null || userData.profileNFT.length < 5)
                                            ? profileNFT(userData.profileImage, 110) :
                                        profileNFT(userData.profileNFT, 110): SizedBox(),),


                                        isMe ? providerUser.profileNFT == null ||providerUser.profileNFT.length < 5 ? SizedBox() :

                                        nftBadge():
                                        userData.profileNFT == null ||userData.profileNFT.length < 5 ? SizedBox() :
                                        nftBadge()
                                      ],
                                    ),
                                  ),

                                  // ClipRRect(
                                  //     borderRadius: BorderRadius.circular(180.0),
                                  //     child: Container(
                                  //       height: 110,
                                  //       width:110,
                                  //       child: CachedNetworkImage(
                                  //         imageUrl: 'https://lh3.googleusercontent.com/AJrJQRSG9Dv6aZbZWWFrYZXtYEA1g5uOno3josLAO0vP-Nr1VWZ6c9JDR-wnMajhtzzh0huDXuUfkTJ8Rry3iGAZUTAlKvofkwcbvuY=w600',
                                  //         progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  //             Padding(
                                  //               padding: const EdgeInsets.all(48.0),
                                  //               child:
                                  //               CircularProgressIndicator(value: downloadProgress.progress),
                                  //             ),
                                  //         errorWidget: (context, url, error) => Icon(Icons.error),
                                  //         fit: BoxFit.cover,
                                  //       ),
                                  //     )),
                                  // Text('NFT'),


                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if (isMe) if(providerEntity.walletAddress != null && providerEntity.walletAddress.length >= 3 )  Column(
                                              children: [
                                                GestureDetector(
                                                  onTap:(){
                                                    HapticFeedback.selectionClick();

                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyNFTsTab(
                                                        openseaNFT
                                                    )),
                                                    );
                                                  },

                                                  child: Text(
                                                    openseaNFT == null ? '0':

                                                    '${openseaNFT.length}',
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight: FontWeight.w900),
                                                  ),
                                                ),
                                                Text('NFTs')
                                              ],
                                            ),
                                            if (!isMe) if(userEntity.walletAddress != null && userEntity.walletAddress.length >= 3 )  GestureDetector(
                                              onTap:(){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyNFTsTab(
                                                    openseaNFT
                                                )),
                                                );
                                              },
                                              child: Column(
                                                children: [
                                                  Text(
                                                    openseaNFT == null ? '0':
                                                    '${openseaNFT.length}',
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight: FontWeight.w900),
                                                  ),
                                                  Text('NFTs',style: TextStyle(color:  Colors.grey[500],),)
                                                ],
                                              ),
                                            ),


                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    HapticFeedback.selectionClick();

                                                    Navigator.pushNamed(context, kNavigatorString.followingTabbar, arguments: [0, widget.userId]);
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        !isMe ? userPublicMetrics.following.toString() :
                                                        providerPublic.following.toString(),
                                                        style: TextStyle(
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.w900),
                                                      ),
                                                      Text('Following',style: TextStyle(color:  Colors.grey[500],),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                              ],
                                            ),

                                            GestureDetector(
                                              onTap: (){
                                                HapticFeedback.selectionClick();

                                                Navigator.pushNamed(context, kNavigatorString.followingTabbar, arguments: [1, widget.userId]);
                                              },
                                              child: Column(
                                                children: [
                                                  Text(
                                                    !isMe ? userPublicMetrics.follower.toString() :
                                                    providerPublic.follower.toString(),
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight: FontWeight.w900),
                                                  ),
                                                  Text('Followers',style: TextStyle(color:  Colors.grey[500],),)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        isMe ? SizedBox() :
                                        Row(
                                          children: [
                                            isFollowing ? Expanded(
                                        child: GestureDetector(
                                          onTap: (){
                                            HapticFeedback.selectionClick();

                                            deleteFollowing(FirebaseAuth.instance.currentUser.uid, widget.userId);
                                            setState(() {
                                              isFollowing = !isFollowing;
                                            });
                                          },
                                        child:  buttonStyleFollowed('Followed'),
                                  ),
                      ):
                                            Expanded(
                                              child: GestureDetector(
                                                  child:  buttonStyleFollow('Follow'),
                                                onTap: (){
                                                  HapticFeedback.selectionClick();

                                                  setState(() {
                                                      isFollowing = !isFollowing;
                                                    });
                                                    createFollowing(FirebaseAuth.instance.currentUser.uid, widget.userId);

                                                },
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Expanded(
                                              child: GestureDetector(
                                                child:  buttonStyleFollowed('Message'),
                                                onTap: (){
                                                  HapticFeedback.selectionClick();

                                                  String title =  makeTalkTitle(FirebaseAuth.instance.currentUser.uid, widget.userId);
                                                  print(title);
                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => Message(
                                                   chatId: title,
                                                   otherUserId:widget.userId,
                                                   userInfo:userData,
                                                 )));
                                                 },
                                              ),
                                            ),
                                          ],
                                        ),
                                        !isMe ? SizedBox() :
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded (
                                              child: GestureDetector(
                                                onTap: (){
                                                  HapticFeedback.selectionClick();
                                                  Navigator.pushNamed(context, kNavigatorString.profile);
                                                },

                                                child:
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                    border: Border.all(color: ColorsConst.whiteGrey),
                                                  ),
                                                  height: 35,
                                                  child: Center(
                                                      child: Text(
                                                        'Edit your profile',
                                                        style: ThemeTextConst.buttonTextStylePostButtonInvalid,
                                                      )),
                                                ),

                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(

                                '${
                                    !isMe ? userData.nickname.toString() :

                                    providerUser.nickname}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              providerUser.bio == null || providerUser.bio.length < 3 ? SizedBox():

                              Column(
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      !isMe ? userData.bio.toString() :

                                      providerUser.bio.toString()
                                  ),
                                ],
                              ),

                              !isMe ?
                              userEntity.walletAddress == null || userEntity.walletAddress.length < 3 ? SizedBox():
                              walletAddress(userEntity.walletAddress, context)
                              :
                              providerEntity.walletAddress == null || providerEntity.walletAddress.length < 3 ? SizedBox():
                              walletAddress(providerEntity.walletAddress, context),
                              !isMe ?
                              userData.url == null || userData.url.length < 3 ? SizedBox():
                              website(userData.url, context)
                                  :
                              providerUser.url == null || providerUser.url.length < 3 ? SizedBox():
                              website(providerUser.url, context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  indicatorColor: ColorsConst.themeColor,
                  indicatorWeight: 1.5,
                  unselectedLabelColor: Colors.grey[400],
                  labelColor: ColorsConst.themeColor,
                  labelPadding: EdgeInsets.all(0),

                  tabs: [
                    Container(
                      height: 35,
                      child: Tab(
                        icon: Text('Posts', style: TextStyle(
                            fontWeight: FontWeight.w600,fontFamily: FontConst.fontBoldFamily),),
                      ),
                    ),
                    Container(
                      height: 35,

                      child: Tab(
                          icon: Text('Collectibles', style: TextStyle(
                              fontWeight: FontWeight.w600,fontFamily: FontConst.fontBoldFamily),)
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height:double.maxFinite,
                  child: TabBarView(
                    children: [
                      SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        header: WaterDropMaterialHeader(),
                        footer: CustomFooter(
                          builder: (BuildContext context,LoadStatus mode){
                            Widget body ;
                            if(mode==LoadStatus.idle){
                              body =  Text("");
                            }
                            else if(mode==LoadStatus.loading){
                              // body =  CupertinoActivityIndicator();
                            }
                            else if(mode == LoadStatus.failed){
                              body = Text("Load Failed!Click retry!");
                            }
                            else if(mode == LoadStatus.canLoading){
                              body = Text("");
                            }
                            else{
                              body = Text("No more Data");
                            }
                            return Container(
                              height: 55.0,
                              child: Center(child:body),
                            );
                          },
                        ),

                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        child:
                        !loadedPosts
                            ? shimmerPost() :
                            allPost.length < 1 ? Center(child: Text('No post yet',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: FontConst.fontSemiBoldFamily,),)) :
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // controller: _scrollController2,
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
                        ),
                      ),
                       (isMe) ? (providerEntity.walletAddress == null || providerEntity.walletAddress.length <= 3 ) ? Container(

                         child: Center(
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30),
                                 color: ColorsConst.whiteGrey
                               ),
                               width: 260,
                               height: 60,
                               child: GestureDetector(
                                 onTap: (){
                                   HapticFeedback.selectionClick();
                                   Navigator.pushNamed(context, kNavigatorString.metamaskSetting);
                                 },
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Container(
                                       width: 30,
                                       height: 30,
                                       child: Image.asset('Assets/Images/metamask.png',
                                           fit: BoxFit.fitHeight,
                                           color: Color.fromRGBO(255, 255, 255, 1),
                                           colorBlendMode: BlendMode.modulate),
                                       // height: MediaQuery.of(context).size.height,
                                     ),
                                     SizedBox(width: 16,),
                                     Text(
                                       'Connect Wallet',
                                       style: ThemeTextConst.buttonTextStyleBlack,
                                     ),
                                   ],
                                 ),
                               ),
                             )),
                       ):
                        MyNFTs(openseaNFT) : MyNFTs(openseaNFT)

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      )
    );
  }
}



Widget walletAddress(address, context){
  return Column(
    children: [
      SizedBox(
        height: 16,
      ),
      Row(
        children: [
          Icon(FontAwesomeIcons.mapMarkerAlt, size: 19),
          SizedBox(
            width: 8,
          ),
          Flexible(

              child: GestureDetector(
                  onTap: (){
                    HapticFeedback.selectionClick();

                    Clipboard.setData(
                        new ClipboardData(
                            text:address.toString()))
                        .then((_) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(
                          content: Text(
                              "Address copied")));
                    });
                  },
                  child: Text(address.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,

                  )))
        ],
      ),
    ],
  );
}

Widget website(url, context){
  return  Column(
    children: [
      SizedBox(
        height: 16,
      ),
      Row(
        children: [
          Icon(
            FontAwesomeIcons.link,
            size: 19,
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
            child: GestureDetector(
              onTap: ()async{
                HapticFeedback.selectionClick();


                String urlLaunch = url.toString();
                if (await canLaunch(url)) {
                await launch(urlLaunch);
                } else {
                  errorPopup('Error','URL is invalid',context);
                  throw 'Could not launch $urlLaunch';
                }
              },
              child: Text(
                url.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(color: ColorsConst.link),
              ),
            ),
          )
        ],
      ),
    ],
  );
}