import 'package:crypties_app/Presentation/Screen/Timeline/View/timeline.dart';
import 'package:crypties_app/exports.dart';

import 'Reaction/reaction.dart';
import 'Reply/reply.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: tabsAppbar('Notification',  "Reaction",  'Reply'),
        body: TabBarView(
          children: [
           Reaction(),
            Reply()
          ],
        ),
      ),
    );
  }
}
