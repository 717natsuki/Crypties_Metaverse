import 'package:crypties_app/exports.dart';

Widget notificationMessage(message, name, userDomain){
  return Flexible(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (userDomain.profileNFT == null || userDomain.profileNFT.length < 5)
            ? profileNFT(userDomain.profileImage, 48) :
        profileNFT(userDomain.profileNFT, 48)
      ,

        SizedBox(width: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: ThemeTextConst.eachPostName,),
            Text(message, style: ThemeTextConst.eachPostScreenName),

          ],
        ),
        Expanded(child: Container(),),
        Text('1 min')
      ],
    ),
  );
}

Widget notificationMessageLiked(message, name, date, userDomain){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      (userDomain.profileNFT == null || userDomain.profileNFT.length < 5)
          ? profileNFT(userDomain.profileImage, 48) :
      profileNFT(userDomain.profileNFT, 48),
   
      SizedBox(width: 8,),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: ThemeTextConst.eachPostName,
          ),
          Text(message,
              style: ThemeTextConst.eachPostScreenName),
        ],
      ),
      Expanded(child: Container(),),
      Text(date.toString())
    ],
  );
}