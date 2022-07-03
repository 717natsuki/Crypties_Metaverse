import 'package:crypties_app/exports.dart';
import 'package:url_launcher/url_launcher.dart';

void needsUpdateFunc(context){
  showDialog(
    context: context,
    builder: (_) {
      return Material(
        color: Color(0xff757575),

        child: AlertDialog(
          title: Text("Update version🙇‍♀️",style: TextStyle(fontSize: 18),),
          content: Text("You need to update"),
          actions: <Widget>[
            FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text("Update"),
              onPressed: () async {
                HapticFeedback.selectionClick();

                // try {
                //   _launchURL() async {
                //     var url;
                //     if (Platform.isIOS){
                //       url = 'https://apps.apple.com/us/app/%E3%82%AC%E3%82%AF%E3%83%81%E3%83%A3-%E5%AD%A6%E7%94%9F%E9%99%90%E5%AE%9A%E3%82%B3%E3%83%9F%E3%83%A5%E3%83%8B%E3%83%86%E3%82%A3/id1544012914';
                //     } else {
                //       url = 'https://play.google.com/store/apps/details?id=com.natsukikataoka.lonelyfood';
                //     }
                //     if (await canLaunch(url)) {
                //       await launch(url);
                //     } else {
                //       throw 'Could not launch $url';
                //     }
                //   }

                  // _launchURL();
                // } catch (e) {
                //   print(e); //Bad state: the door is locked
                // }
              },
            ),
          ],
        ),
      );
    },
  );
}