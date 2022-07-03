import 'package:crypties_app/exports.dart';
import 'package:crypties_app/exports.dart';

import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

// Future uploadPic(image) async {
//   String uid = FirebaseAuth.instance.currentUser.uid;
//   String fileName = basename(image.path);
//   Reference firebaseStorageRef =
//   FirebaseStorage.instance.ref().child('timeline/${uid}/$fileName');
//   Task uploadTask = firebaseStorageRef.putFile(image);
//   var taskSnapshot = await uploadTask.whenComplete(() {});
//   String url = (await firebaseStorageRef.getDownloadURL()).toString();
//   return url;
// }
