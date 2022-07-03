import 'package:crypties_app/exports.dart';



class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Entity providerEntity = Provider.of<Entity>(context);

    return Scaffold(
        appBar: settingAppbar(context, 'Settings'),

        backgroundColor: Colors.white,
        body: SafeArea(
      child: Column(
        children: [
          // Container(
          //   color: Colors.white,
          //   child: TextButton(
          //       onPressed: () async {
          //         HapticFeedback.selectionClick();
          //         Navigator.pushNamed(context, kNavigatorString.profile);
          //
          //       },
          //       child:settingButton('Profile')
          //   ),
          // ),
          Container(
            color: Colors.white,
            child: TextButton(
              onPressed: () async {
                HapticFeedback.selectionClick();
                Navigator.pushNamed(context, kNavigatorString.account);

              },
              child:settingButton('Account',FontAwesomeIcons.solidUser)
            ),
          ),
          // Container(
          //   color: Colors.white,
          //   child: TextButton(
          //       onPressed: () async {
          //         HapticFeedback.selectionClick();
          //         Navigator.pushNamed(context, kNavigatorString.notificationSetting);
          //
          //       },
          //       child:settingButton('Notification')
          //   ),
          // ),
          // Container(
          //   color: Colors.white,
          //   child: TextButton(
          //       onPressed: () async {
          //         HapticFeedback.selectionClick();
          //         Navigator.pushNamed(context, kNavigatorString.blockedUser);
          //
          //       },
          //       child:settingButton('Blocked users')
          //   ),
          // ),
          Container(
            color: Colors.white,
            child: TextButton(
                onPressed: () async {
                  HapticFeedback.selectionClick();
                  Navigator.pushNamed(context, kNavigatorString.about);

                },
                child:settingButton('About this app',FontAwesomeIcons.infoCircle)
            ),
          ),
          providerEntity.walletAddress == null || providerEntity.walletAddress.length < 4?
          Container(
            color: Colors.white,
            child: TextButton(
                onPressed: () async {
                  HapticFeedback.selectionClick();
                  Navigator.pushNamed(context, kNavigatorString.metamaskSetting);
                },
                child:settingButtonMetamask('Connect Metamask')
            ),
          ) : SizedBox(),
          Container(
            color: Colors.white,
            child: TextButton(
                onPressed: () async {
                  HapticFeedback.selectionClick();
                  String url = 'https://discord.gg/MGtGW5cUcN';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    // errorPopup('Error','URL is invalid',context);
                    // throw 'Could not launch $urlLaunch';
                  }
                },
                child:settingButton('Join Discord',FontAwesomeIcons.discord)
            ),
          ),
          Container(
            color: Colors.white,
            child: TextButton(
                onPressed: () async {
                  HapticFeedback.selectionClick();
                  String url = 'https://twitter.com/NFTCrypties';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    // errorPopup('Error','URL is invalid',context);
                    // throw 'Could not launch $urlLaunch';
                  }
                },
                child:settingButton('Twitter',FontAwesomeIcons.twitter)
            ),
          ),

          // Container(
          //   color: Colors.white,
          //   child: TextButton(
          //       onPressed: () async {
          //         HapticFeedback.selectionClick();
          //
          //       },
          //       child:settingButtonGradient('Share Crypties')
          //   ),
          // )
        ],
      ),
    ));
  }
}

