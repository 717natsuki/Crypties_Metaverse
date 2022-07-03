import 'package:crypties_app/exports.dart';
import 'dart:convert'; // for the utf8.encode method

String makeTalkTitle(my_hash_id, anotherPerson_hash_id) {
  var talkTitleName;

  List<int> bytes1 = utf8.encode(my_hash_id.toString());
  List<int> bytes2 = utf8.encode(anotherPerson_hash_id.toString());

  var sha256_my_hash_id = bytes1.reduce((a, b) => a + b);
  var sha256_anotherPerson_hash_id = bytes2.reduce((a, b) => a + b);

  if (sha256_my_hash_id > sha256_anotherPerson_hash_id){
    talkTitleName = anotherPerson_hash_id + my_hash_id;
  }
  if (sha256_my_hash_id < sha256_anotherPerson_hash_id) {
    talkTitleName = my_hash_id + anotherPerson_hash_id;
  }
  if (sha256_my_hash_id == sha256_anotherPerson_hash_id) {
    String firstLetter = my_hash_id.substring(1, 6);
    String firstLetter2 = anotherPerson_hash_id.substring(1, 6);
    List<int> bytes1 = utf8.encode(firstLetter);
    List<int> bytes2 = utf8.encode(firstLetter2);

    var sha256_firstLetter = bytes1.reduce((a, b) => a + b);
    var sha256_firstLetter2 = bytes2.reduce((a, b) => a + b);

    if (sha256_firstLetter>sha256_firstLetter2){
      talkTitleName = my_hash_id + anotherPerson_hash_id;
    } else{
      talkTitleName = anotherPerson_hash_id + my_hash_id;
    }
  }
  return talkTitleName;
}