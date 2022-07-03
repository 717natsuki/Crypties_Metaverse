// import 'package:crypties_app/Model/Post/MyPost/getMyPost.dart';
// import 'package:crypties_app/exports.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:crypties_app/Model/Post/MyPost/getMyPostAfter.dart';
// class MyPosts extends StatefulWidget {
//   @override
//   _MyPostsState createState() => _MyPostsState();
// }
//
// class _MyPostsState extends State<MyPosts> {
//   List allPost = [];
//   RefreshController _refreshController = RefreshController(initialRefresh: false);
//   ScrollController controller = ScrollController();
//   bool loaded = false;
//   bool isNoMoreToShow = false;
//
//   @override
//   void initState() {
//     initFunc();
//     super.initState();
//   }
//   void initFunc()async{
//     allPost = await getMyPost();
//     setState(() {
//       loaded = true;
//       allPost = allPost;
//     });
//   }
//   void _onRefresh() async {
//     HapticFeedback.mediumImpact();
//     initFunc();
//     _refreshController.refreshCompleted();
//   }
//   void _onLoading() async {
//     print('loading !!!!!!!!!!!!!!!!!');
//     if (!isNoMoreToShow){
//       List afterPost = await getMyPostAfter(allPost[allPost.length - 1]['createdAt']);
//       if (afterPost.isEmpty){
//         setState(() {
//           isNoMoreToShow = true;
//         });
//       }
//       allPost = new List.from(allPost)..addAll(afterPost);
//       setState(() {
//         allPost = allPost;
//       });
//       afterPost = [];
//     }
//     _refreshController.loadComplete();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       // height:double.maxFinite,
//       child: ListView.builder(
//         shrinkWrap: true,   //追加
//         physics: const NeverScrollableScrollPhysics(),
//         controller: controller,
//         itemBuilder: (BuildContext context, int index) {
//
//           return allPost[index]['isDeleted'] != null &&
//               allPost[index]['isDeleted']
//               ? SizedBox()
//               : Column(
//             children: [
//               EachPost(
//                 postInfo: allPost[index],
//               ),
//             ],
//           );
//         },
//         itemCount: allPost.length,
//       )
//     );
//   }
// }
//
//
//
// // class MyPosts extends StatefulWidget {
// //   @override
// //   _MyPostsState createState() => _MyPostsState();
// // }
// //
// // class _MyPostsState extends State<MyPosts> {
// //   List allPost = [];
// //   RefreshController _refreshController = RefreshController(initialRefresh: false);
// //   ScrollController controller = ScrollController();
// //   bool loaded = false;
// //   bool isNoMoreToShow = false;
// //
// //   @override
// //   void initState() {
// //     initFunc();
// //     super.initState();
// //   }
// //   void initFunc()async{
// //     allPost = await getMyPost();
// //     setState(() {
// //       loaded = true;
// //       allPost = allPost;
// //     });
// //   }
// //   void _onRefresh() async {
// //     HapticFeedback.mediumImpact();
// //     initFunc();
// //     _refreshController.refreshCompleted();
// //   }
// //   void _onLoading() async {
// //     print('loading !!!!!!!!!!!!!!!!!');
// //     if (!isNoMoreToShow){
// //       List afterPost = await getMyPostAfter(allPost[allPost.length - 1]['createdAt']);
// //       if (afterPost.isEmpty){
// //         setState(() {
// //           isNoMoreToShow = true;
// //         });
// //       }
// //       allPost = new List.from(allPost)..addAll(afterPost);
// //       setState(() {
// //         allPost = allPost;
// //       });
// //       afterPost = [];
// //     }
// //     _refreshController.loadComplete();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return  SingleChildScrollView(
// //       child: Container(
// //         height:double.maxFinite,
// //         child: SmartRefresher(
// //             footer: CustomFooter(
// //               builder: (BuildContext context, LoadStatus mode) {
// //                 Widget body;
// //                 if (mode == LoadStatus.idle) {
// //                   body = Text("");
// //                 } else if (mode == LoadStatus.loading) {
// //                   body = CircularProgressIndicator(
// //                       valueColor: new AlwaysStoppedAnimation<Color>(ColorsConst.themeColor));
// //                 } else if (mode == LoadStatus.failed) {
// //                   body = Text("Error");
// //                 } else if (mode == LoadStatus.canLoading) {
// //                   body = Text("");
// //                 } else {
// //                   body = Text("No more data");
// //                 }
// //                 return Container(
// //                   height: 55.0,
// //                   child: Center(child: body),
// //                 );
// //               },
// //             ),
// //             enablePullDown: true,
// //             enablePullUp: true,
// //             header: WaterDropMaterialHeader(),
// //             controller: _refreshController,
// //             scrollController: controller,
// //             onRefresh: _onRefresh,
// //             onLoading: _onLoading,
// //             child: !loaded
// //                 ? shimmerPost()
// //                 : ListView.builder(
// //               shrinkWrap: true,   //追加
// //               physics: const NeverScrollableScrollPhysics(),
// //               controller: controller,
// //               itemBuilder: (BuildContext context, int index) {
// //
// //                 return allPost[index]['isDeleted'] != null &&
// //                     allPost[index]['isDeleted']
// //                     ? SizedBox()
// //                     : Column(
// //                   children: [
// //                     EachPost(
// //                       postInfo: allPost[index],
// //                     ),
// //                   ],
// //                 );
// //               },
// //               itemCount: allPost.length,
// //             )),
// //       ),
// //     );
// //   }
// // }
// //
// //
//
