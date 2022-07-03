import 'package:crypties_app/exports.dart';

class Bio extends StatefulWidget {
  @override
  _BioState createState() => _BioState();
}

class _BioState extends State<Bio> {
  UserDomain providerUser;
  String bio;

  @override
  void initState() {
    providerUser = Provider.of<UserDomain>(context, listen: false);
    initFunc();
    super.initState();
  }
  void initFunc()async{
    bio = providerUser.bio;
    setState(() {
      bio = bio;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserDomain providerUser = Provider.of<UserDomain>(context);


    return Scaffold(
        appBar: editProfileAppbar(context, kProfileInfo.bio, providerUser, bio),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  maxLines: 10,
                  initialValue: bio,
                  onChanged: (value){
                    bio = value;
                    setState(() {
                      bio = bio;
                    });
                  },
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Hello! My name is Crypties!'
                  ),
                )

              ],
            ),
          ),
        ));
  }
}

