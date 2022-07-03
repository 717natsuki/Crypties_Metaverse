import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:crypties_app/exports.dart';


class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppbar(context, 'Account'),

        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                    },
                    child:settingInputButton('Email', FirebaseAuth.instance.currentUser.email.toString())
                ),
              ),
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                    },
                    child:settingInputButton('Password', '***********')
                ),
              ),
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.lightImpact();

                      bool isLogout = await okCancelAlert('Logout?', 'Are you sure you want to log out of Crypties?', 'Logout', 'Cancel', true, context);
                      if (isLogout){
                        HapticFeedback.lightImpact();
                        FirebaseAuth.instance
                            .signOut();

                        Navigator.pushAndRemoveUntil(
                            context,
                            new MaterialPageRoute(
                                builder:
                                    (context) =>
                                    Loading()),
                                (_) => false);
                      }else{
                        HapticFeedback.lightImpact();

                      }


                    },
                    child:settingRedButton('Log out')
                ),
              ),
              // Container(
              //   color: Colors.white,
              //   child: TextButton(
              //       onPressed: () async {
              //         HapticFeedback.selectionClick();
              //
              //       },
              //       child:settingRedButton('Delete this account')
              //   ),
              // ),
            ],
          ),
        ));
  }
}

