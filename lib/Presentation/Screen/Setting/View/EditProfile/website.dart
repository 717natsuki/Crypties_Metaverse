import 'package:crypties_app/exports.dart';

class Website extends StatefulWidget {
  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  UserDomain providerUser;
  String website;

  @override
  void initState() {
    providerUser = Provider.of<UserDomain>(context, listen: false);
    initFunc();
    super.initState();
  }
  void initFunc()async{
    website = providerUser.url;
    setState(() {
      website = website;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: editProfileAppbar(context, kProfileInfo.website, providerUser, website),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  maxLines: 1,
                  // maxLength: 20,
                  initialValue: website,
                  onChanged: (value){
                    value = value.trim().toLowerCase();
                    website = value.replaceAll(' ', '');
                    print(website);
                    setState(() {
                      website = website;
                    });
                  },
                  decoration: new InputDecoration.collapsed(
                      hintText: 'https://opensea.io/takahin'
                  ),
                )

              ],
            ),
          ),
        ));
  }
}
