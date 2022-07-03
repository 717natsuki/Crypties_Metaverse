import 'package:crypties_app/exports.dart';


Widget appbarTitile(title){
  return Row(
    children: [
      Expanded(child: Container()),

      Padding(
        padding: const EdgeInsets.all(0.0),
        child: ShaderMask(
          shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            title,
            // style: TextStyle(color: Colors.white),
            style: ThemeTextConst.appTitleTabbar,
          ),
        ),
      ),
      Expanded(child: Container()),
    ],
  );
}
Widget appbarTitileProfile(title, accessed){
  return

    Padding(
      padding: const EdgeInsets.all(0.0),
      child: ShaderMask(
        shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(
          '@'+title,
          // style: TextStyle(color: Colors.white),
          style: ThemeTextConst.appBarProfile,
        ),
      ),
    );
}

Widget appbarTitileTimeline(title, message){
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                title,
                // style: TextStyle(color: Colors.white),
                style: ThemeTextConst.appTitleTabbar,
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                message,
                // style: TextStyle(color: Colors.white),
                style: ThemeTextConst.appSubTitleTabbar,
              ),
            )
          ],
        ),
      ),
      Expanded(child: Container()),
    ],
  );
}