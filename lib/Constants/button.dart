import 'package:crypties_app/Constants/textStyle.dart';
import 'package:crypties_app/exports.dart';



Widget buttonStyle(text){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: GradientConst.themeGradientLine,
    ),
    width: double.maxFinite,
    height: 60,
    child: Center(
        child: Text(
          text,
          style: ThemeTextConst.buttonTextStyle,
        )),
  );
}
Widget buttonStyleGrey(text){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color:Color(0xff2081E2)
    ),
    width: double.maxFinite,
    height: 60,
    child: Center(
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
              text,
              style: ThemeTextConst.buttonTextStyleWhite,
            ),
          ],
        )),
  );
}
Widget buttonStylePost(text){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      gradient: GradientConst.themeGradientLine,
    ),
    width: 90,
    height: 26,
    child: Center(
        child: Text(
          text,
          style: ThemeTextConst.buttonTextStylePostButton,
        )),
  );
}
Widget buttonStylePostNoContent(text){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: ColorsConst.whiteGrey
    ),
    width: 90,
    height: 26,
    child: Center(
        child: Text(
          text,
          style: ThemeTextConst.buttonTextStylePostButtonInvalid,
        )),
  );
}


Widget buttonStyleFollow(text){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      gradient: GradientConst.themeGradientLine,
    ),
    // width: 110,
    height: 35,
    child: Center(
        child: Text(
          text,
          style: ThemeTextConst.buttonTextStylePostButton,
        )),
  );
}
Widget buttonStyleFollowed(text){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
        color: ColorsConst.whiteGrey
    ),
    width:double.maxFinite,
    height: 35,
    child: Center(
        child: Text(
          text,
          style: ThemeTextConst.buttonTextStylePostButtonInvalid,
        )),
  );
}