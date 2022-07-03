import 'package:crypties_app/exports.dart';

Widget nftBadge(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      // Expanded(child: Container(),),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: GradientConst.themeGradientLine,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right:6,left:6,top:0.0,bottom: 0),
                child: Text('NFT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
              )),
          SizedBox(width: 0,)
        ],
      ),
      SizedBox(height: 4,)

    ],
  );
}
Widget nftBadgeSmall(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      // Expanded(child: Container(),),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: GradientConst.themeGradientLine,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right:4,left:4,top:1.0,bottom: 1),
                child: Text('NFT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 9),),
              )),
          SizedBox(width: 0,)
        ],
      ),
      SizedBox(height: 4,)

    ],
  );
}