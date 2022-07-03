import 'package:crypties_app/exports.dart';

String timeDifference(createdDate){
  String timedif;
  if (DateTime.now().difference(createdDate).inDays < 1) {
    if (DateTime.now().difference(createdDate).inHours >= 1) {
      timedif = '${DateTime.now().difference(createdDate).inHours}h';
    } else {
      if (DateTime.now().difference(createdDate).inMinutes >= 1) {
        timedif = '${DateTime.now().difference(createdDate).inMinutes}m';
      } else {
        timedif = '${DateTime.now().difference(createdDate).inSeconds}s';
      }
    }
  }else {
    timedif = '${createdDate.day}/${createdDate.month}/${createdDate.year}';
  }
  return timedif;
}