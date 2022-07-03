// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:crypties_app/Model/Post/getEachPost.dart';
// import 'package:crypties_app/Model/User/getUser.dart';
// import 'package:crypties_app/exports.dart';
//
//
//
// class RetweetPost extends StatefulWidget {
//   final postInfo;
//   RetweetPost({this.postInfo});
//
//   @override
//   _RetweetPostState createState() => _RetweetPostState();
// }
//
// class _RetweetPostState extends State<RetweetPost> {
//
//   @override
//   Widget build(BuildContext context) {
//     return  widget.postInfo['isQuote'] != null && widget.postInfo['isQuote'] == true ?
//     QuotePost(widget.postInfo)
//         :
//
//     Column(
//       children: [
//         Row(children: [
//           Icon(Icons.sync),
//           Text('This tweet has been retweeted'),
//         ],),
//         Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child:GestureDetector(
//               onTap: (){
//                 Navigator.pushNamed(context, kNavigatorString.detailPost);
//
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left:16.0,right: 8),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(widget.postInfo.toString()),
//                         Row(
//                           children: [
//                             PostUserProfile(widget.postInfo['retweetingUserInfo']),
//                             SizedBox(width: 8,),
//                             PostUserInfo(widget.postInfo['retweetingUserInfo'], widget.postInfo),
//                             Expanded(child: Container()),
//                             IconButton(icon: Icon(Icons.more_horiz), onPressed: (){})
//                           ],
//                         ),
//                         SizedBox(height: 8,),
//                         PostText(widget.postInfo),
//                         SizedBox(height: 8,),
//                       ],
//                     ),
//                   ),
//                   widget.postInfo['image1'] == null ? SizedBox():
//                   PostImage(),
//                   SizedBox(height: 8,),
//                   Padding(
//                     padding: const EdgeInsets.only(right:28.0,left: 28),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // replyEachPost(previousPost, context),
//                         // retweetEachPost(previousPost, context),
//                         // quoteEachPost(previousPost, context),
//                         // likeEachPost(previousPost, context)
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//
//         ),
//       ],
//     );
//
//
//   }
// }
//
//
