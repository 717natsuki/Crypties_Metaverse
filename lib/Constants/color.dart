
import 'package:crypties_app/exports.dart';

class ColorsConst{
  static const Color themeColor = Colors.blue;
  static const Color gray = Color(0xff707070);
  static const Color link = Colors.blueAccent;
  static const Color whiteGrey = Color(0xffEFEFEF);

  static const Color blue = Color(0xff276BFF);
  static const Color pink = Color(0xffF974F1);
  static const Color orange = Color(0xffFF8227);
  static const Color red = Colors.redAccent;
  static const Color lightBlue = Color(0xff00D1FF);
  static const Color purple = Color(0xffC67EFF);

}

class GradientConst{
  static Shader themeGradient = LinearGradient(
    colors: <Color>[
      Color(0xff0E50FF),
      Color(0xff276BFF),
      Color(0xff7597FD),
      Color(0xffC67EFF),
      Color(0xffF974F1),
    ],
  ).createShader(
    Rect.fromLTWH(
      0.0,
      0.0,
      250.0,
      70.0,
    ),
  );
  static LinearGradient themeGradientLine = LinearGradient(
    colors: <Color>[
      Color(0xff0E50FF),
      Color(0xff276BFF),
      Color(0xff7597FD),
      Color(0xffC67EFF),
      Color(0xffF974F1),
    ],
  );

}