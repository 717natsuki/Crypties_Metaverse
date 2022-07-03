import 'package:crypties_app/exports.dart';

Widget progressIndicator(context){
  return CircularProgressIndicator(
      valueColor:
      new AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor));
}