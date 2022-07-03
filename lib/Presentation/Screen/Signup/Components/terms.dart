import 'package:crypties_app/exports.dart';

Widget terms() {
  return Center(
    child: Row(children: [
      Expanded(child: Container()),
      Text('I agree to to the'),
      GestureDetector(
          onTap: () async {
  String url = 'https://app-release-info.web.app/crypties/term/';
            if (await canLaunch(url)) {
  await launch(url);
  } else {
  // errorPopup('Error','URL is invalid',context);
  // throw 'Could not launch $urlLaunch';

  }},
          child: Text(' terms', style: TextStyle(color: ColorsConst.link),)),
      Text(' and'),
      GestureDetector(
          onTap: () async {
            String url = 'https://app-release-info.web.app/crypties/privacy/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              // errorPopup('Error','URL is invalid',context);
              // throw 'Could not launch $urlLaunch';

            }},
          child: Text(' privacy policy', style: TextStyle(color: ColorsConst.link))),
      Expanded(child: Container()),
    ],),
  );
}