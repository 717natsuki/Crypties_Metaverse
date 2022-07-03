


import 'package:crypties_app/Presentation/Screen/EachPost/View/DetailPost/detailPost.dart';
import 'package:crypties_app/Presentation/Screen/Login/View/Components/login.dart';
import 'package:crypties_app/Presentation/Screen/Profile/View/FollowingFollower/tabbar.dart';
import 'package:crypties_app/Presentation/Screen/Setting/View/connectMetamask.dart';

import 'Presentation/Screen/tabbar.dart';
import 'exports.dart';

void main() {
  print('started!');
  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDomain>(
          create: (_) => UserDomain(),
        ),
        ChangeNotifierProvider<PublicMetrics>(
          create: (_) => PublicMetrics(),
        ),    ChangeNotifierProvider<Entity>(
          create: (_) => Entity(),
        ),
      ],
      // create: (context) => UserDomain(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsConst.themeColor,
          fontFamily: 'Poppins_Bold',
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.black)),
        ),
        initialRoute: kNavigatorString.loading,
        routes: {
          kNavigatorString.loading : (context) => Loading(),
          kNavigatorString.welcome: (context) => Welcome(),
          kNavigatorString.signup: (context) => Signup(),
          kNavigatorString.connectMetamask : (context) => ConnectMetamask(),
          kNavigatorString.tabbar : (context) => Tabbar(),
          kNavigatorString.settings : (context) => SettingsPage(),
          kNavigatorString.account : (context) => Account(),
          kNavigatorString.blockedUser : (context) => BlockedUser(),
          kNavigatorString.about : (context) => About(),
          kNavigatorString.notificationSetting : (context) => NotificationSetting(),
          kNavigatorString.profile: (context) => EditProfile(),
          kNavigatorString.bio : (context) => Bio(),
          kNavigatorString.nickname : (context) => Nickname(),
          kNavigatorString.profileNft : (context) => ProfileNFT(),
          kNavigatorString.screenName : (context) => ScreenName(),
          kNavigatorString.website: (context) => Website(),
          kNavigatorString.followingTabbar: (context) => FollowingTabbar(),
          kNavigatorString.detailPost: (context) => DetailPost(),
          kNavigatorString.login: (context) => Login(),
          kNavigatorString.metamaskSetting: (context) => ConnectMetamaskSetting(),
        },
      )
    );
  }
}

