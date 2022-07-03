import 'package:crypties_app/exports.dart';

String fontfamily = 'Poppins_Regular';
String fontBoldFamily = 'Poppins_Bold';
class FontConst{
  static String fontfamily = 'Poppins_Regular';
  static String fontBoldFamily = 'Poppins_Bold';
  static String fontSemiBoldFamily = 'Poppins_SemiBold';

}
class ThemeTextConst{
  static TextStyle appTitle= TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 57,
      color: Colors.white,
      // foreground: Paint()..shader = GradientConst.themeGradient,
      fontWeight: FontWeight.w900);

  static TextStyle introBigText = TextStyle(
      fontFamily:  FontConst.fontSemiBoldFamily,
      fontSize: 37,
      color: Colors.white,
      // foreground: Paint()..shader = GradientConst.themeGradient,
      fontWeight: FontWeight.w900);
  static TextStyle introBigTextBlack = TextStyle(
      fontFamily: fontfamily,
      fontSize: 37,
      color: Colors.black87,
      fontWeight: FontWeight.w900);

  //app title tabbar
  static TextStyle appTitleTabbar = TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 24,
      color: Colors.white,
      // foreground: Paint()..shader = GradientConst.themeGradient,
      fontWeight: FontWeight.w900);
  static TextStyle appBarAccessName = TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 22,
      color: Colors.black,
      // foreground: Paint()..shader = GradientConst.themeGradient,
      fontWeight: FontWeight.w900
  );

  //app title tabbar
  static TextStyle appBarProfile= TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 25,
      color: Colors.white,
      // foreground: Paint()..shader = GradientConst.themeGradient,
      fontWeight: FontWeight.w900);

  //app title sub tabbar
  static TextStyle appSubTitleTabbar = TextStyle(
      fontFamily: fontfamily,
      fontSize: 17,
      color: Colors.white,
      // foreground: Paint()..shader = GradientConst.themeGradient,
      fontWeight: FontWeight.w800);

  static TextStyle introSmallText = TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 30,
      color: Colors.white,
      // foreground: Paint()..shader = GradientConst.themeGradient,
      fontWeight: FontWeight.w900);

  static TextStyle appDescription= TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 28,
      color: Colors.white70,
      fontWeight: FontWeight.w700);

  static TextStyle connectMetamaskDescription = TextStyle(
      fontFamily: fontfamily,
      fontSize: 20,
      color: Colors.black87,
      fontWeight: FontWeight.w600);

  static TextStyle buttonTextStyle= TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w900);
  static TextStyle buttonTextStyleBlack= TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w900);
  static TextStyle buttonTextStyleWhite= TextStyle(
      // fontFamily: fontfamily,
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w700);
  static TextStyle subText =  TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 16,
      fontWeight: FontWeight.w900,
    color: Colors.white70,
  );

  static TextStyle textFormFieldExplain =  TextStyle(
      fontFamily: fontfamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorsConst.gray);
  static TextStyle buttonTextStylePostButton= TextStyle(
      fontFamily: fontfamily,
      fontSize: 13,
      color: Colors.white,
      fontWeight: FontWeight.w800);
  static TextStyle buttonTextStylePostButtonInvalid= TextStyle(
      fontFamily: FontConst.fontSemiBoldFamily,
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w800);
  static TextStyle eachPostName= TextStyle(
      fontFamily: fontfamily,
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w600);
  static TextStyle eachPostScreenName = TextStyle(
      fontFamily: fontfamily,
      color: ColorsConst.gray,
      fontWeight: FontWeight.w500);
  static TextStyle eachPostQuoteName= TextStyle(
      fontFamily: fontfamily,
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w600);
  static TextStyle eachPostScreeQuotenName = TextStyle(
      fontFamily: fontfamily,
      color: ColorsConst.gray,
      fontSize: 13 ,
      fontWeight: FontWeight.w500);

  static TextStyle detailPostString= TextStyle(
      fontFamily: fontfamily,
      fontSize: 10,
      color: ColorsConst.gray,
      fontWeight: FontWeight.w400);
  static TextStyle detailPostTitle= TextStyle(
      fontFamily: fontfamily,
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.w800);

  static TextStyle mentionStyle= TextStyle(
      fontFamily: fontfamily,
      // fontSize: 15,
      color: Colors.blue,
      // fontWeight: FontWeight.w800
  );
}