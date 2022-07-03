import 'package:crypties_app/exports.dart';

class ConnectMetamaskSetting extends StatefulWidget {
  @override
  _ConnectMetamaskSettingState createState() => _ConnectMetamaskSettingState();
}

class _ConnectMetamaskSettingState extends State<ConnectMetamaskSetting> {
  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:
        Builder(
          builder: (context) =>
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Text(
                            StringButtonConst.connectMetamask,
                            style: ThemeTextConst.introSmallText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      StringButtonConst.connectMetamaskIntro,
                      style: ThemeTextConst.connectMetamaskDescription,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Text(
                    //   'URL',
                    //   style: ThemeTextConst.textFormFieldExplain,
                    // ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.link),
                            SizedBox(width: 16,),
                            Flexible(
                              child: GestureDetector(
                                onTap: ()async{
                                  String urlLaunch = 'https://crypties-release.web.app'.toString();
                                  if (await canLaunch(urlLaunch)) {
                                    await launch(urlLaunch);
                                  } else {
                                    errorPopup('Error','URL is invalid',context);
                                    throw 'Could not launch $urlLaunch';
                                  }
                                },
                                child: Text(
                                  'https://crypties-release.web.app/',
                                  softWrap: true,

                                  style: TextStyle(color: ColorsConst.link),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 24,),
                        GestureDetector(
                          onTap: ()async{
                            HapticFeedback.selectionClick();

                            Clipboard.setData(
                                new ClipboardData(
                                    text:'https://crypties-release.web.app'.toString()))
                                .then((_) {
                              Scaffold.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "Link copied")));
                            });
                          },
                          child: Container(

                              height: 50,
                              width:  double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xffF4F8FF),
                              ),
                              child: Center(child: Text('Copy link',style: TextStyle(color: Color(0xff6E9CE4),fontWeight: FontWeight.w700,),))),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        onTap: ()async  {
                          HapticFeedback.lightImpact();
                          String urlLaunch = 'https://metamask.app.link/dapp/crypties-release.web.app'.toString();
                          if (await canLaunch(urlLaunch)) {
                            await launch(urlLaunch);
                          } else {
                            errorPopup('Error','URL is invalid',context);
                            throw 'Could not launch $urlLaunch';
                          }
                        },
                        child: buttonStyleGrey(StringButtonConst.openMetamask)),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        TextButton(
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              Navigator.pop(context);
                            },
                            child:
                            Text('Not now', style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ))),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              )
        ),
      );
  }
}
