import 'package:crypties_app/Model/Post/destroyPost.dart';
import 'package:crypties_app/Model/User/createBlock.dart';
import 'package:crypties_app/Model/User/getUser.dart';
import 'package:crypties_app/Presentation/Screen/EachPost/View/Components/Detail/detailPostProfile.dart';
import 'package:crypties_app/exports.dart';

import 'Components/Detail/detailPostUserInfo.dart';
import 'DetailPost/detailPost.dart';
import 'LikedPostUsers/likedUsers.dart';
import 'QuotedPosts/quotedPosts.dart';

class QuotePost extends StatelessWidget {
  final postInfo;
  QuotePost(this.postInfo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:
      GestureDetector(
        onTap: (){
          HapticFeedback.selectionClick();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPost(
                  postInfo: postInfo,
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
                  Row(
                    children: [
                      PostUserProfile(postInfo['userInfo']),
                      SizedBox(width: 8,),
                      PostUserInfo(postInfo['userInfo'], postInfo),
                      Expanded(child: Container()),
                      IconButton(icon: Icon(Icons.more_horiz), onPressed: ()async{
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
                                            postId: postInfo['postId'],
                                          )),
                                          );

                                        },
                                      ),
                                      ListTile(
                                        title: Text('Quoted posts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                        onTap: (){
                                          HapticFeedback.selectionClick();

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => QuotedPostsScreen(
                                            postId: postInfo['postId'],
                                            userInfo:postInfo['userInfo']
                                          )),
                                          );
                                        },
                                      ),
                                      postInfo['userId']==FirebaseAuth.instance.currentUser.uid ? SizedBox():

                                      ListTile(
                                        title: Text('Report this user', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                                        onTap: ()async{
                                          HapticFeedback.selectionClick();

                                          bool isOk = await okCancelAlert('Report this user?','Are you sure you want to report this user?', 'Report', 'Cancel', true, context);

                                        },
                                      ),
                                      postInfo['userId']!=FirebaseAuth.instance.currentUser.uid ? SizedBox():
                                      ListTile(
                                        title: Text('Delete this post', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                                        onTap: ()async{
                                          HapticFeedback.selectionClick();

                                          bool isOk = await okCancelAlert('Delete this post?','Are you sure you want to delete this post?', 'Delete', 'Cancel', true, context);
                                          if(isOk){
                                            destroyPostModel(postInfo['postId']);
                                            setState(() {
                                              // deleted = true;
                                            });

                                          }

                                        },
                                      ),
                                      postInfo['userId']==FirebaseAuth.instance.currentUser.uid ? SizedBox():
                                      ListTile(
                                        title: Text('Block this user', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                                        onTap: ()async{
                                          HapticFeedback.selectionClick();

                                          bool isOk = await okCancelAlert('Block this user?','Are you sure you want to block this user?', 'Block', 'Cancel', true, context);
                                          if(isOk){
                                            createBlock(FirebaseAuth.instance.currentUser.uid, postInfo['userId']);
                                            setState(() {
                                              // deleted = true;
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
                  SizedBox(height: 8,),
                  PostText(postInfo),
                  SizedBox(height: 8,),
                ],
              ),
            ),
            postInfo['image1'] == null ? SizedBox():
            PostImage(postInfo['image1'] ),
            // Text(postInfo['previousPostUserInfo'].toString()),
            // Text(postInfo['userInfo'].nickname.toString()),
            QuotedPost(postInfo['previousPostInfo'],  postInfo['previousPostUserInfo']),
            SizedBox(height: 8,),

            Padding(
              padding: const EdgeInsets.only(right:28.0,left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  replyEachPost(postInfo, context),
                  retweetEachPost(postInfo, context),
                  quoteEachPost(postInfo, context),
                  likeEachPost(postInfo, context)
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}





class QuotedPost extends StatelessWidget {
  final postInfo, userInfo;
  QuotedPost(
      this.postInfo,this.userInfo
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 20,right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          border: Border.all(color: ColorsConst.whiteGrey),

        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom:10,left:14.0,right: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DetailPostProfile(userInfo),

                  SizedBox(width: 8,),
                  DetailPostUserInfo(userInfo, postInfo)
                  // Expanded(child: Container()),
                  // IconButton(icon: Icon(Icons.more_horiz), onPressed: (){})
                ],
              ),
              SizedBox(height: 4,),
              // Text(postInfo.toString())
              PostText(postInfo),
            ],
          ),
        ),
      ),
    );
  }
}

