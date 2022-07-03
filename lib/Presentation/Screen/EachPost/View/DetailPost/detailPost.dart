import 'package:crypties_app/Presentation/Screen/EachPost/View/DetailPost/likes.dart';
import 'package:crypties_app/Presentation/Screen/EachPost/View/DetailPost/quotes.dart';
import 'package:crypties_app/Presentation/Screen/EachPost/View/DetailPost/replies.dart';
import 'package:crypties_app/Presentation/Screen/EachPost/View/DetailPost/spreads.dart';
import 'package:crypties_app/exports.dart';
class DetailPost extends StatefulWidget {
  final postInfo;
  DetailPost({this.postInfo });

  @override
  _DetailPostState createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppbar(context, 'Post'),
        backgroundColor: Colors.white,
        body:  DefaultTabController(
      length: 4,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 16,
                  ),
                 EachPost(postInfo: widget.postInfo,)
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
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[400],
                indicatorWeight: 1,
                indicatorColor: Colors.black,

                tabs: [
                  Tab(
                    icon: Row(children: [
                      Text('${widget.postInfo['replyNum']}', style: ThemeTextConst.detailPostTitle,),
                      SizedBox(width: 4,),
                      Text('Replies', style: ThemeTextConst.detailPostString,)
                    ],)
                  ),
                  Tab(
                      icon: Row(children: [
                        Text('${widget.postInfo['retweetNum']}', style: ThemeTextConst.detailPostTitle,),
                        SizedBox(width: 2,),
                        Text('Spreads', style: ThemeTextConst.detailPostString,)
                      ],)
                  ), Tab(
                      icon: Row(children: [
                        Text('${widget.postInfo['quoteNum']}', style: ThemeTextConst.detailPostTitle,),
                        SizedBox(width: 4,),
                        Text('Quotes', style: ThemeTextConst.detailPostString,)
                      ],)
                  ), Tab(
                      icon: Row(children: [
                        Text('${widget.postInfo['likeNum']}', style: ThemeTextConst.detailPostTitle,),
                        SizedBox(width: 4,),
                        Text('Likes', style: ThemeTextConst.detailPostString,)
                      ],)
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DetailPostReplies(widget.postInfo['postId']),
                  // Container(),
                  // Container(),
                  // Container(),
                  DetailPostSpreads(widget.postInfo['postId']),
                  DetailPostQuotes(widget.postInfo['postId']),
                  DetailPostLikes(widget.postInfo['postId']),
              //     Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}