import 'package:crypties_app/Model/User/getUser.dart';
import 'package:crypties_app/Presentation/Screen/Welcome/View/bannedUser.dart';
import 'package:crypties_app/exports.dart';
import 'isJailBroken.dart';

void checkUser(context, provider, provider2, provider3)async {
  WidgetsFlutterBinding.ensureInitialized();
  bool jailBroken = true;
  var rmcfigVersion;
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await Firebase.initializeApp();
  final RemoteConfig remoteConfig = RemoteConfig.instance;
  jailBroken = await isUserJailBroken(context);

  remoteConfig.setDefaults(<String, dynamic>{
    'iosVersion': '0',
    'killSwitch': false,
    'androidVersion': '0',

  });
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: Duration(seconds: 10),
    minimumFetchInterval: Duration(hours: 1),
  ));
  bool updated = await remoteConfig.fetchAndActivate();
  if (jailBroken) {
    // jailBreak(context);
  } else {
    if (Platform.isIOS){
      // final defaults = <String, int>{'iosVersion': 0};
      // await remoteConfig.setDefaults(defaults);
      rmcfigVersion = remoteConfig.getString('iosVersion');
      print(rmcfigVersion.toString());
    } else if (Platform.isAndroid){
      final defaultsAndroid = <String, int>{'androidVersion': 0};
      await remoteConfig.setDefaults(defaultsAndroid);
      rmcfigVersion = remoteConfig.getString('androidVersion');
    }

      String appVersion = packageInfo.version;
      appVersion = appVersion.replaceAll(".", "");
      rmcfigVersion = rmcfigVersion.replaceAll(".", "");
      bool needsUpdate = false;
      if (int.parse(rmcfigVersion.toString()) > int.parse(appVersion.toString())) needsUpdate = true;
      print(rmcfigVersion + '   > ' + ' $appVersion' + 'needsUpdate $needsUpdate' + '　　！！！');
      if(needsUpdate){
        needsUpdateFunc(context);
      } else {

        final defaults = <String, bool>{'killSwitch': false};
        await remoteConfig.setDefaults(defaults);
        var killSwitch = remoteConfig.getBool('killSwitch');
        if (killSwitch){
          needsMaintenance(context);
        } else {
          try{
            String uid = FirebaseAuth.instance.currentUser.uid;
            if (uid != null){
              Map info = await entityInfo(uid);
              provider3.setEntity(info);

              Map userData = await userInfo(uid);
              provider.setUser(userData);

              Map metrics = await publicMetricsInfo(uid);
              provider2.setPublicMetrics(metrics);

              if (await info['isBanned']){
                bannedUser(context);
              }
              else {
                // toDoFirst(context, );
                Navigator.pushNamedAndRemoveUntil(context, kNavigatorString.tabbar, ModalRoute.withName('/'));
              }
            } else {
              Navigator.pushNamedAndRemoveUntil(context, kNavigatorString.welcome, ModalRoute.withName('/'));
            }
          }catch(e){
            print(e.toString());
            Navigator.pushNamedAndRemoveUntil(context, kNavigatorString.welcome, ModalRoute.withName('/'));
          }
        }
      }
    }
  // }
}
