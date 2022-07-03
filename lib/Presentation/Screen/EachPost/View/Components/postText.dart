import 'package:crypties_app/exports.dart';

class PostText extends StatelessWidget {
  final postInfo;
  PostText(this.postInfo);

  @override
  Widget build(BuildContext context) {
    return Text(postInfo['text'].toString());
  }
}
