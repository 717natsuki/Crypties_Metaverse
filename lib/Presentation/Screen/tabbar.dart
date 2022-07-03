import 'package:crypties_app/Presentation/Template/nftBadge.dart';
import 'package:crypties_app/exports.dart';
import 'Message/View/chatlist.dart';
import 'Notification/View/notification.dart';
import 'Profile/View/profile.dart';
import 'package:crypties_app/Presentation/Screen/Timeline/View/timeline.dart';

import 'Search/View/search.dart';
class Tabbar extends StatefulWidget {
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedIndex = 0;
  ScrollController controller = ScrollController();
  List<Widget> navigationPage = [];

  void _onItemTapped(int index) async {
    HapticFeedback.lightImpact();
// //    player.play('buttonTap.mp3',volume: 0.1);
//
//     if (index == 0 && _selectedIndex == index) {
// //    if (index == 0){
//       controller.animateTo(0, duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
//     }
//
//     if (index == 2) {
//       // delete badge
//       if (notification['chat']) {
//         deleteBadge('chat');
//         notification['chat'] = false;
//         setState(() {
//           notification = notification;
//         });
//       }
//       var status = await Permission.notification.status;
//       if (status.isUndetermined) {
//         if (Platform.isAndroid) {
//         } else {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) => CupertinoAlertDialog(
//                 title: new Text("他のユーザーからのメッセージをお知らせします"),
// //          content: new Text("This is my content"),
//                 actions: <Widget>[
//                   CupertinoDialogAction(
//                     child: Text("はい"),
//                     onPressed: () {
//                       Navigator.pop(context);
//                       FirebaseMessaging().requestNotificationPermissions();
//                     },
//                   )
//                 ],
//               ));
//         }
//       }
//     }
//
//     //delete badge
//     if (index == 3 && (notification['notification'])) {
//       deleteBadge('notification');
//       notification['notification'] = false;
//       setState(() {
//         notification = notification;
//       });
//     }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    //updateFollowerAndFollowingNumはもう利用しない。
    checkNotificationToken();
    initFunc();

    super.initState();
    navigationPage = [
      Timeline(
          // controller: controller,
      ),
      NotificationPage(),

      Search(),
      ChatList(),
      Profile(),
    ];

  }

  void initFunc() async {
    await Future.delayed(Duration(milliseconds: 510));
    // shouldNotifyPopUp(context);

  }
  BottomNavigationBar _buildBottomNavigationBar() {
    return new BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            title: new Text("trends")
        ),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.location_on),
            title: new Text("feed")
        ),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            title: new Text("trends")
        ),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.location_on),
            title: new Text("feed")
        ),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text("community")
        )
      ],
      onTap: (index) {_onItemTapped(index);},
    );
  }


  //TODO: keep token in shared preference!
  void checkNotificationToken() async {
    // FirebaseMessaging().onTokenRefresh.listen((token) async {
    //   final prefs = await SharedPreferences.getInstance();
    //   final String firebaseTokenPrefKey = 'firebaseToken5';
    //   final String currentToken = prefs.getString(firebaseTokenPrefKey);
    //   if (currentToken != token) {
    //     // TODO: update push token!
    //     updateUser(FirebaseAuth.instance.currentUser.uid, 'pushToken', token);
    //     // add code here to do something with the updated token
    //     await prefs.setString(firebaseTokenPrefKey, token);
    //   }
    // });
  }

  Map notification = {'chat': false, 'reply': false, 'reaction': false, 'notification':false};


  @override
  Widget build(BuildContext context) {


    return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          primaryColor: ColorsConst.themeColor,

        ),
        child:Scaffold(
            body:
            Stack(
              children: [
                IndexedStack(
                    index: _selectedIndex,
                    children:navigationPage
                ),
              ],
            ),

            bottomNavigationBar:
            // StreamBuilder(
            //     stream: FirebaseFirestore.instance
            //         .collection("users")
            //         .doc(FirebaseAuth.instance.currentUser.uid)
            //         .collection('badges')
            //         .snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         final obj = snapshot.data.docs;
            //         for (var message in obj) {
            //           final messageText = message.data()["type"];
            //           notification[messageText] = true;
            //         }
            //       }
            //
            //       return
            //
                    BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Color(0xffF9F9FB),
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home_outlined,
                            size: 27,
                          ),
                          title: Text(''),
                      activeIcon:  Icon(
                        Icons.home,
                        size: 27,
                      ),),

                      BottomNavigationBarItem(
                          activeIcon: Stack(
                            children: [
                              Container(
                                width: 50,
                                child: Icon(
                                  Icons.notifications,
                                  size: 27,
                                ),
                              ),
//                                notification['reply'] || notification['reaction'] || notification['footprint']
                              notification['notification']
                                  ? Positioned(
                                left: 25.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              )
                                  : Text(''),
                            ],
                          ),
                          icon: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    child: Icon(
                                      Icons.notifications_none,
                                      size: 27,
                                    ),
                                  ),
                                  notification['chat'] == true
                                      ? Positioned(
                                    left: 28.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        color: Colors.blue,
                                      ),
                                      height: 10,
                                      width: 10,
                                    ),
                                  )
                                      : Text(''),
                                ],
                              ),
                            ],
                          ),
                          title: Text('')),
                      BottomNavigationBarItem(
                        activeIcon:   Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: GradientConst.themeGradientLine,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right:8,left:8,top:4.0,bottom: 4),
                              child: Text('NFT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                            )),
                          icon:  Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: GradientConst.themeGradientLine,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right:8,left:8,top:4.0,bottom: 4),
                                child: Text('NFT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                              )),
                          title: Text('')),
                      BottomNavigationBarItem(
                          activeIcon: Stack(
                            children: [
                              Container(
                                width: 50,
                                child: Icon(
                                Icons.email,
                                  size: 27,
                                ),
                              ),
//                                notification['reply'] || notification['reaction'] || notification['footprint']
                              notification['notification']
                                  ? Positioned(
                                left: 25.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              )
                                  : Text(''),
                            ],
                          ),
                          icon: Stack(
                            children: [
                              Container(
                                width: 50,
                                child: Icon(
                                  Icons.email_outlined,
                                  size: 27,
                                ),
                              ),
//                                notification['reply'] || notification['reaction'] || notification['footprint']
                              notification['notification']
                                  ? Positioned(
                                left: 25.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              )
                                  : Text(''),
                            ],
                          ),
                          title: Text('')),
                      BottomNavigationBarItem(
                          activeIcon: Stack(
                            children: [
                              Container(
                                width: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 27,
                                ),
                              ),
//                                notification['reply'] || notification['reaction'] || notification['footprint']
                              notification['notification']
                                  ? Positioned(
                                left: 25.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              )
                                  : Text(''),
                            ],
                          ),
                          icon: Icon(
                            Icons.person_outline,
                            size: 27,
                          ),
                          title: Text('')),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.black,
                    onTap: _onItemTapped,
                  )
                // })


        )

    );
  }
}