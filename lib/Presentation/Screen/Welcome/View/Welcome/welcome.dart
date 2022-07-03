import 'package:crypties_app/exports.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,

              child: Image.asset('Assets/Images/mesh_2.png',
                  fit: BoxFit.fitHeight,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  colorBlendMode: BlendMode.modulate),
              // height: MediaQuery.of(context).size.height,
            ),
            Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(
                height: 100,
              ),
              Text(
                AppInfoConst.appName,
                style: ThemeTextConst.appTitle,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                AppInfoConst.appDescription,
                style: ThemeTextConst.appDescription,
              ),
              Expanded(child: Container()),
              GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();

                    Navigator.pushNamed(context, kNavigatorString.signup);
                  },
                  child:buttonStyle(StringButtonConst.newAccount) ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  TextButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();

                        Navigator.pushNamed(context, kNavigatorString.login);

                      },
                      child: Text(StringButtonConst.login,
                          style: ThemeTextConst.subText)),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ],
      ),
    ),
          ],
        ));
  }
}
