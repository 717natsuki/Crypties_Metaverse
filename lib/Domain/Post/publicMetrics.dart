import 'package:crypties_app/exports.dart';

class PostPublicMetrics extends ChangeNotifier {
  int replyNum;
  int likeNum;
  int retweetNum;
  int quoteNum;

  PostPublicMetrics.fromJson(Map<dynamic, dynamic> json)
      : replyNum = json['replyNum'] as int,
        likeNum = json['likeNum'] as int,
        retweetNum = json['retweetNum'] as int,
        quoteNum = json['quoteNum'] as int
  ;

  PostPublicMetrics({this.replyNum, this.likeNum, this.retweetNum, this.quoteNum});
}
