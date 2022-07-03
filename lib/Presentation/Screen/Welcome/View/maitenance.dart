import 'package:crypties_app/exports.dart';
void needsMaintenance(context){
  showDialog(
    context: context,
    builder: (_) {
      return Material(
        color: Color(0xff757575),
        child: AlertDialog(
          title: Text("Maintainace in progress🙇‍️",style: TextStyle(fontSize: 18),),
          content: Text("Wait until we finish making big changes!"),
        ),
      );
    },
  );
}