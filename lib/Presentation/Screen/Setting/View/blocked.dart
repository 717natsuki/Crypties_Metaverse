import 'package:crypties_app/exports.dart';

class BlockedUser extends StatefulWidget {
  @override
  _BlockedUserState createState() => _BlockedUserState();
}

class _BlockedUserState extends State<BlockedUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppbar(context, 'Blocked Users'),

        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [

            ],
          ),
        ));
  }
}

