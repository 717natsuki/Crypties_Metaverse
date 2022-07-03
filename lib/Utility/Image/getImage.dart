import 'package:crypties_app/exports.dart';

import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';

import 'cropImage.dart';

Future<File> getImage(context ) async {
  try {
    PickedFile image = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    var imageFile = await  cropImage(image.path) ;
    if(imageFile != null){
        return imageFile;
    }
  } catch (e){
    if (e.code != null && e.code == 'photo_access_denied'){
      errorPopup('Error','Please allow us to access your photo library.', context);
    } else {
      errorPopup('Error','Error: $e', context);

    }
  }
}
Future<File> getImageChat(context ) async {
  try {
    PickedFile image = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    var imageFile = await  cropImageChat(image.path) ;
    if(imageFile != null){
      return imageFile;
    }
  } catch (e){
    if (e.code != null && e.code == 'photo_access_denied'){
      errorPopup('Error','Please allow us to access your photo library.', context);
    } else {
      errorPopup('Error','Error: $e', context);

    }
  }
}

Future<File> getImageAvatar(context ) async {
  try {
    PickedFile image = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    var imageFile = await  cropImageAvatar(image.path) ;
    if(imageFile != null){
      return imageFile;
    }
  } catch (e){
    if (e.code != null && e.code == 'photo_access_denied'){
      errorPopup('Error','Please allow us to access your photo library.', context);
    } else {
      errorPopup('Error','Error: $e', context);

    }
  }
}

Future uploadPic(image) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  String fileName = basename(image.path);
  Reference firebaseStorageRef =
  FirebaseStorage.instance.ref().child('users/${uid}/$fileName');
  Task uploadTask = firebaseStorageRef.putFile(image);
  var taskSnapshot = await uploadTask.whenComplete(() {});
  String url = (await firebaseStorageRef.getDownloadURL()).toString();
  return url;
}


Future uploadPicChat(image, chatId) async {
  String fileName = basename(image.path);
  Reference firebaseStorageRef =
  FirebaseStorage.instance.ref().child('chats/${chatId}/$fileName');
  Task uploadTask = firebaseStorageRef.putFile(image);
  var taskSnapshot = await uploadTask.whenComplete(() {});
  String url = (await firebaseStorageRef.getDownloadURL()).toString();
  return url;
}

Future uploadInterestPic(image) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  String fileName = basename(image.path);

  Reference firebaseStorageRef =
  FirebaseStorage.instance.ref().child('users/${uid}/interests/$fileName');
  Task uploadTask = firebaseStorageRef.putFile(image);
  var taskSnapshot = await uploadTask.whenComplete(() {});
  String url = (await firebaseStorageRef.getDownloadURL()).toString();
  print(url.toString());
  return url;
}
