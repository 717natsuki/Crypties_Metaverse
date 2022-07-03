import 'package:crypties_app/exports.dart';

class NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppbar(context, 'Notification Setting'),

        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [

            ],
          ),
        ));
  }
}

