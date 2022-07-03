import 'package:crypties_app/exports.dart';

class Nickname extends StatefulWidget {
  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname> {
  UserDomain providerUser;
  String nickname;

  @override
  void initState() {
    providerUser = Provider.of<UserDomain>(context, listen: false);
    initFunc();
    super.initState();
  }
  void initFunc()async{
    nickname = providerUser.nickname;
    setState(() {
      nickname = nickname;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: editProfileAppbar(context, kProfileInfo.nickname, providerUser, nickname),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  initialValue: nickname,
                  maxLines: 1,
                  maxLength: 20,
                  onChanged: (value){
                    nickname = value;
                    setState(() {
                       nickname = nickname;
                    });
                  },
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Natsuki Kataoka'
                  ),
                )

              ],
            ),
          ),
        ));
  }
}

