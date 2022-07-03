import 'package:crypties_app/exports.dart';

Widget settingAppbar(context, title){
  return AppBar(
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    backgroundColor: Colors.white,
    title:Text(title,style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
    elevation: 0,
  );
}
