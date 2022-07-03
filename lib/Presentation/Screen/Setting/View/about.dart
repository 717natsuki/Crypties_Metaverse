import 'package:crypties_app/exports.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppbar(context, 'About this app'),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      String url = 'https://app-release-info.web.app/crypties/privacy/';
                      if (await canLaunch(url)) {
    await launch(url);
    } else {
    // errorPopup('Error','URL is invalid',context);
    // throw 'Could not launch $urlLaunch';

    }
                    },
                    child:settingButton('Privacy policy',FontAwesomeIcons.pencilRuler)
                ),
              ),
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      String url = 'https://app-release-info.web.app/crypties/term/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        // errorPopup('Error','URL is invalid',context);
                        // throw 'Could not launch $urlLaunch';

                      }
                    },
                    child:settingButton('Terms of service',FontAwesomeIcons.users)
                ),
              ),
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      String urlLaunch = 'https://forms.gle/e6Sc4smmXerXLdgS7';
                      if (await canLaunch(urlLaunch)) {
                        await launch(urlLaunch);
                      } else {
                        errorPopup('Error','URL is invalid',context);
                        throw 'Could not launch $urlLaunch';
                      }
                    },
                    child:settingButton('Contact developer',FontAwesomeIcons.code)
                ),
              ),
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();

                      String urlLaunch = 'https://forms.gle/e6Sc4smmXerXLdgS7';
                      if (await canLaunch(urlLaunch)) {
                        await launch(urlLaunch);
                      } else {
                        errorPopup('Error','URL is invalid',context);
                        throw 'Could not launch $urlLaunch';
                      }

                    },
                    child:settingButtonGradient('Give feedbacks!')
                ),
              )
            ],
          ),
        ));
  }
}