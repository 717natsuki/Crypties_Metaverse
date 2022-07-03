import 'package:crypties_app/exports.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File> cropImage(imagePath) async {
  File croppedFile = await ImageCropper.cropImage(
      maxHeight: 900,
      maxWidth: 900,
      sourcePath: imagePath,
      // aspectRatio: type == 2 ? CropAspectRatio(
      //   ratioX: 20, ratioY: 8,
      // ) : type == 1 || ImageType.interest == type || ImageType.squareBig == type ? CropAspectRatio(ratioX: 50, ratioY: 50) : null ,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Change Size',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        doneButtonTitle: 'Select',
        title: 'Change Size',
      ));
  return croppedFile;
}


Future<File> cropImageChat(imagePath) async {
  File croppedFile = await ImageCropper.cropImage(
      maxHeight: 900,
      maxWidth: 900,
      sourcePath: imagePath,
      // aspectRatio: type == 2 ? CropAspectRatio(
      //   ratioX: 20, ratioY: 8,
      // ) : type == 1 || ImageType.interest == type || ImageType.squareBig == type ? CropAspectRatio(ratioX: 50, ratioY: 50) : null ,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Send',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        doneButtonTitle: 'Send',
        title: 'Change Size',
      ));
  return croppedFile;
}



Future<File> cropImageAvatar(imagePath) async {
  File croppedFile = await ImageCropper.cropImage(
      maxHeight: 700,
      maxWidth: 700,
      sourcePath: imagePath,
      aspectRatio: CropAspectRatio(ratioX: 50, ratioY: 50)  ,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Send',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        doneButtonTitle: 'Send',
        title: 'Change Size',
      ));
  return croppedFile;
}