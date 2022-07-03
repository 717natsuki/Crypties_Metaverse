import 'package:crypties_app/exports.dart';


InputDecoration textBoxStyle(hint){
  return InputDecoration(
    contentPadding: EdgeInsets.all(20.0),

    fillColor: Colors.grey,
    focusedBorder: OutlineInputBorder(

      borderRadius: BorderRadius.circular(125.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(125.0),
      borderSide: BorderSide(
        color: Colors.black87,
        width: 1.0,
      ),
    ),
    hintText: hint,
    border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(128),
    ),
  );
}

InputDecoration searchTextBox(hint){
  return InputDecoration(
    contentPadding: EdgeInsets.all(20.0),
    filled: true,

    fillColor: ColorsConst.whiteGrey,
    focusedBorder: OutlineInputBorder(

      borderRadius: BorderRadius.circular(125.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(125.0),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
    ),
    hintText: hint,
    border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(128),
    ),
  );
}