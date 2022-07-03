
import 'package:crypties_app/exports.dart';

Widget postComponent(message){
  return Container(

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),

      border: Border.all(color: ColorsConst.whiteGrey),

    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,),
    ),
  );
}