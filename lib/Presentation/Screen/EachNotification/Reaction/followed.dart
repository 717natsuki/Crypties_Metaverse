import 'package:crypties_app/exports.dart';

class Followed extends StatefulWidget {
  final reaction;
  Followed(this.reaction);

  @override
  _FollowedState createState() => _FollowedState();
}

class _FollowedState extends State<Followed> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: ()async{
        HapticFeedback.selectionClick();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile(
                userId: widget.reaction['userInfo'].userId,
                // isQuote: true,
              )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(   FontAwesomeIcons.user,
                size: 30,color: ColorsConst.blue,),
            SizedBox(width: 8,),
            notificationMessage(kNotificationString.follow, widget.reaction['userInfo'].nickname.toString(), widget.reaction['userInfo'])
          ],
        ),
      ),
    );
  }
}
  