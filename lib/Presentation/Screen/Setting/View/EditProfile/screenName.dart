import 'package:crypties_app/exports.dart';

class ScreenName extends StatefulWidget {
  @override
  _ScreenNameState createState() => _ScreenNameState();
}

class _ScreenNameState extends State<ScreenName> {
  UserDomain providerUser;
  String screenName;

  @override
  void initState() {
    providerUser = Provider.of<UserDomain>(context, listen: false);
    initFunc();
    super.initState();
  }
  void initFunc()async{
    screenName = providerUser.screenName;
    setState(() {
      screenName = screenName;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: editProfileAppbar(context, kProfileInfo.username, providerUser, screenName),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('@',style: TextStyle(color: ColorsConst.link),),
                    Flexible(
                      child: TextFormField(
                        style: TextStyle(color: ColorsConst.link),

                        inputFormatters: [new WhitelistingTextInputFormatter(RegExp("^[a-zA-Z0-9_][a-zA-Z0-9_.]*")),],
                        autofocus: true,
                        initialValue: screenName,
                        onChanged: (value){
                          screenName = value;
                          setState(() {
                            screenName = screenName;
                          });
                        },
                        maxLength: 15,
                        maxLines: 1,
                        // maxLength: 15,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'natsuki'
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ));
  }
}
