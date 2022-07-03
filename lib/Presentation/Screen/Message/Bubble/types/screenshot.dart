import 'package:crypties_app/exports.dart';
class InformationBubble extends StatefulWidget {
  final String messageContent;
  InformationBubble({@required this.messageContent});

  @override
  _InformationBubbleState createState() => _InformationBubbleState();
}

class _InformationBubbleState extends State<InformationBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Row(
        children: [
          Expanded(child: Container()),
          Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(100),
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16,bottom: 3,top: 3),
                child: Center(child: Text(widget.messageContent,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.white),)),
              )),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
