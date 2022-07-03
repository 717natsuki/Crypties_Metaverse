import 'package:crypties_app/exports.dart';


Future<bool> isUserJailBroken(context) async {

  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  final defaults = <String, bool>{'isJailBreakOk': false};
  await remoteConfig.setDefaults(defaults);
  bool isJailBreakOk = remoteConfig.getBool('isJailBreakOk');
  bool isTrustFall = false;

  if (Platform.isAndroid){
    isTrustFall = (await TrustFall.isJailBroken) || !(await TrustFall.isRealDevice);
  } else {
    isTrustFall = await TrustFall.isTrustFall;
  }

  if (isJailBreakOk || !isTrustFall){
    print('not jail broken');
    return false;
  } else {
    print('jail broken!!!');
    return true;
  }
}
