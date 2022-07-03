import 'package:crypties_app/exports.dart';

class PostUserInfo extends StatelessWidget {
  final userdata, postInfo;
  PostUserInfo(this.userdata, this.postInfo);

  @override

  Widget build(BuildContext context) {
    final Entity providerEntity = Provider.of<Entity>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userdata.nickname == null ? SizedBox():
        Row(
          children: [
            Text(userdata.nickname, style: ThemeTextConst.eachPostName,),
            providerEntity.isVerified && userdata.userId == FirebaseAuth.instance.currentUser.uid?
            Padding(
              padding: const EdgeInsets.only(left:4.0),
              child: Icon(Icons.verified, color: Colors.blue,size: 17,),
            ) : SizedBox()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('@${userdata.screenName}', style: ThemeTextConst.eachPostScreenName,),
            Text('・', style: ThemeTextConst.eachPostScreenName),
            Text(timeDifference(postInfo['createdAt'].toDate()), style: ThemeTextConst.eachPostScreenName),


          ],
        )
      ],
    );
  }
}
