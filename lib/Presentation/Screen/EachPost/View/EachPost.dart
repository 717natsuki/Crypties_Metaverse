import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypties_app/Model/Post/destroyPost.dart';
import 'package:crypties_app/Model/User/createBlock.dart';
import 'package:crypties_app/Model/User/getUser.dart';
import 'package:crypties_app/Presentation/Screen/EachPost/View/DetailPost/detailPost.dart';
import 'package:crypties_app/Presentation/Screen/EachPost/View/retweetPost.dart';
import 'package:crypties_app/exports.dart';

import 'LikedPostUsers/likedUsers.dart';
import 'QuotedPosts/quotedPosts.dart';



class EachPost extends StatefulWidget {
  final postInfo;
  EachPost({this.postInfo});

  @override
  _EachPostState createState() => _EachPostState();
}

class _EachPostState extends State<EachPost> {
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    return
      deleted ? SizedBox():

      widget.postInfo['isQuote'] != null && widget.postInfo['isQuote'] == true ?
    FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: (){
          HapticFeedback.selectionClick();

          Navigator.push(

            context,
            MaterialPageRoute(
                builder: (context) => DetailPost(
                  postInfo: widget.postInfo,
                  // isQuote: true,
                )),
          );
        },
        child: Column(
          children: [
            QuotePost(widget.postInfo),

            Divider(thickness: 0.5),

          ],
        ))
        :
    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: (){
          HapticFeedback.selectionClick();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPost(
                  postInfo: widget.postInfo,
                )),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left:16.0,right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.postInfo['retweetingUserInfo']==null  || widget.postInfo['retweetingUserInfo'].nickname == null? SizedBox():
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(
                                userId: widget.postInfo['retweetingUserInfo'].userId,
                              )),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Icon(Icons.sync),
                        SizedBox(width: 8,),
                        Flexible(
                          child: Text('This post has been spread by ${widget.postInfo['retweetingUserInfo'].nickname}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,),
                        ),
                      ],),
                    ),
                  ),
                  Row(
                    children: [
                      PostUserProfile(widget.postInfo['userInfo']),
                      SizedBox(width: 8,),
                      PostUserInfo(widget.postInfo['userInfo'], widget.postInfo),
                      Expanded(child: Container()),
                      IconButton(icon: Icon(Icons.more_horiz), onPressed: ()async {
                        HapticFeedback
                            .selectionClick();
                        bool result =
                            await showModalBottomSheet<
                            bool>(
                          context: context,
                          builder: (BuildContext
                          context) {
                            return StatefulBuilder(
                                builder:
                                    (BuildContext
                                context,
                                    setState) {
                                  return Column(
                                    mainAxisSize:
                                    MainAxisSize
                                        .min,
                                    children: <
                                        Widget>[
                                          ListTile(
                                            title: Text('Liked users', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                            onTap: (){
                                              HapticFeedback.selectionClick();

                                              Navigator.push(context, MaterialPageRoute(builder: (context) => LikedUsers(
                                                postId: widget.postInfo['postId'],
                                              )),
                                              );

                                            },
                                          ),
                                      ListTile(
                                        title: Text('Quoted posts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                        onTap: (){
                                          HapticFeedback.selectionClick();

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => QuotedPostsScreen(
                                            postId: widget.postInfo['postId'],
                                          )),
                                          );
                                        },
                                      ),
                                      widget.postInfo['userId']==FirebaseAuth.instance.currentUser.uid ? SizedBox():

                                      ListTile(
                                        title: Text('Report this user', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                                        onTap: ()async{
                                          HapticFeedback.selectionClick();

                                          bool isOk = await okCancelAlert('Report this user?','Are you sure you want to report this user?', 'Report', 'Cancel', true, context);

                                        },
                                      ),
                                      widget.postInfo['userId']!=FirebaseAuth.instance.currentUser.uid ? SizedBox():
                                      ListTile(
                                        title: Text('Delete this post', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                                        onTap: ()async{
                                          HapticFeedback.selectionClick();

                                          bool isOk = await okCancelAlert('Delete this post?','Are you sure you want to delete this post?', 'Delete', 'Cancel', true, context);
                                          if(isOk){
                                            destroyPostModel(widget.postInfo['postId']);
                                            setState(() {
                                              deleted = true;
                                            });

                                          }

                                        },
                                      ),
                                      widget.postInfo['userId']==FirebaseAuth.instance.currentUser.uid ? SizedBox():
                                      ListTile(
                                        title: Text('Block this user', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                                        onTap: ()async{
                                          HapticFeedback.selectionClick();

                                          bool isOk = await okCancelAlert('Block this user?','Are you sure you want to block this user?', 'Block', 'Cancel', true, context);
                                          if(isOk){
                                            createBlock(FirebaseAuth.instance.currentUser.uid, widget.postInfo['userId']);
                                            setState(() {
                                              deleted = true;
                                            });

                                          }

                                        },
                                      ),
                                      SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  );
                                });
                          },
                        );

                      })
                    ],
                  ),
                  // Text('Replying to ${widget.postInfo}'),

                  SizedBox(height: 8,),
                  widget.postInfo['isReply']== null || !widget.postInfo['isReply'] ? SizedBox() :
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(
                                userId: widget.postInfo['replyUserInfo'].userId,
                              )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Text('Replying to '),
                            Text('@${widget.postInfo['replyUserInfo'].screenName}',style: ThemeTextConst.mentionStyle,),
                          ],
                        ),
                      )),
                  PostText(widget.postInfo),
                  SizedBox(height: 8,),
                ],
              ),
            ),
            widget.postInfo['image1'] == null ? SizedBox():
            PostImage(widget.postInfo['image1']),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(right:28.0,left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  replyEachPost(widget.postInfo, context),
                  retweetEachPost(widget.postInfo, context),
                  quoteEachPost(widget.postInfo, context),
                  likeEachPost(widget.postInfo, context)
                ],
              ),
            ),
            SizedBox(height: 0,),

            Divider(thickness: 0.5),

          ],
        ),
      )

    );
  }
}

