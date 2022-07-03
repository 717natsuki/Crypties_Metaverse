import 'package:crypties_app/exports.dart';
class DetailPostUserInfo extends StatelessWidget {
  final userInfo, postInfo;
  DetailPostUserInfo(this.userInfo, this.postInfo);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userInfo.nickname.toString(), style: ThemeTextConst.eachPostQuoteName,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('@${userInfo.screenName}', style: ThemeTextConst.eachPostScreeQuotenName,),
            Text('・', style: ThemeTextConst.eachPostScreeQuotenName),
            Text('${timeDifference(postInfo['createdAt'].toDate())}', style: ThemeTextConst.eachPostScreeQuotenName),

          ],
        )
      ],
    );
  }
}
