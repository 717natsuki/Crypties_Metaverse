import 'dart:math';

import 'package:crypties_app/exports.dart';

Future createUser(nickname, email, password) async {
  try {

    var user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user;

    if (user.uid != null) {
      String pushToken;
      Random random = new Random();
      int randomNumber = random.nextInt(9);
      int randomNumber2 = random.nextInt(9);

      String stringImageSmall = 'https://firebasestorage.googleapis.com/v0/b/crypties-release.appspot.com/o/pfp%2F00${randomNumber}${randomNumber2}.JPG?alt=media&token=6388597b-4cca-42d2-8633-f4789894305f';

      FirebaseMessaging.instance.getToken().then((token) async {
        pushToken = token;
        Map unigram = {};
        for (int i = 0; nickname.length > i; i++){
          unigram[nickname[i]] = true;
        }

        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          "userId": user.uid,
          "profileImage": stringImageSmall,
          "nickname": nickname,
          "screenNameUnigram": unigram,
          "nicknameUnigram": unigram,
          'bio': '',
          "updatedAt": FieldValue.serverTimestamp(),
          "createdAt": FieldValue.serverTimestamp(),
          'pinnedPost': null,
          'isNotifyLikeTimelinePost': true,
          'isNotifyLikeCommunityPost': true,
          'isNotifyReplyTimelinePost': true,
          'isNotifyReplyCommunityPost': true,
          'isNotifyChat': true,
          'isNotifyFollower': true,
          'location': null,
          'protected': false,
          'url': null,
          'postCount': 0,
          'screenName': getRandomString(10),
          'isAcceptChat': false,
          'isVerified':false,
          'status':0,
          'isBanned':false,
        });

        Map deviceData = {};
        final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
        try {
          if (Platform.isAndroid) {
            deviceData =  readAndroidBuildData(await deviceInfoPlugin.androidInfo);
          } else if (Platform.isIOS) {
            deviceData =  readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
          }
        } on PlatformException {
          deviceData = <String, dynamic>{
            'Error:': 'Failed to get platform version.'
          };
        }
        FirebaseFirestore.instance.collection('users').doc(user.uid).collection('config').doc('config').set({
          'pushToken': pushToken,
          'ipAddress': await GetIp.ipAddress,
          'deviceInfo': deviceData,
        });
        FirebaseFirestore.instance.collection('users').doc(user.uid).collection('publicMetrics').doc('publicMetrics').set({
          'follower': 0,
          'following': 0
        });
        FirebaseFirestore.instance.collection('users').doc(user.uid).collection('entity').doc('entity').set({
         'isBanned':false,
          'isVerified':false,
          'walletAddress':null,
          'status':0,
          'walletAddress2':null,
          'walletAddress3':null,
          'walletAddress4':null,
          "userId": user.uid,
        });

        // nicknameUnigram(nickname);
      });
    }
    Random random = new Random();

    int randomNumber = random.nextInt(9);

    if(randomNumber<2){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Hi there, just started Crypties.',null);
    } else if(randomNumber<3){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Just hopped into Crypties',null);

    }else if(randomNumber<4){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Just started Crypties',null);

    }else if(randomNumber<5){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Hello! Started Crypties!',null);

    }else if(randomNumber<6){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Yo guys, just joined',null);

    }else if(randomNumber<7){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Just joined here, hi guys.',null);

    }else if(randomNumber<8){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Hi, just hopped into Crypties',null);

    }else if(randomNumber<9){
      createPostModel(FirebaseAuth.instance.currentUser.uid, 'Hi, just hopped into Crypties',null);

    }

    return true;
  } catch (e) {
    return e;
  }
}
