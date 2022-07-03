import 'package:crypties_app/Presentation/Screen/Profile/View/FollowingFollower/follower.dart';
import 'package:crypties_app/Presentation/Screen/Profile/View/FollowingFollower/following.dart';
import 'package:crypties_app/exports.dart';

class FollowingTabbar extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;

    return DefaultTabController(
      initialIndex: args[0],
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(

            iconTheme: IconThemeData(
                color: Colors.black
            ),
            backgroundColor: Colors.white,
            title:Text('',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
            elevation: 1,
            bottom: TabBar(
                indicatorColor:  ColorsConst.themeColor,
                indicatorWeight: 1.5,
                unselectedLabelColor: Colors.grey[400],
                labelColor:ColorsConst.themeColor,

                labelPadding: EdgeInsets.only(bottom: 5),
                // indicatorPadding: EdgeInsets.only(right:20,left: 20),
                tabs: [
                  Text(
                    "Following",
                    style: TextStyle(
                      fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Follower',
                    style: TextStyle(
                       fontWeight: FontWeight.w600),
                  )
                ]),
          ),
        ),
        body: TabBarView(
          children: [
            FollowingPage(args[1] == null ? FirebaseAuth.instance.currentUser.uid : args[1]),
            FollowerPage(args[1] == null ? FirebaseAuth.instance.currentUser.uid : args[1]),

            // Following(controller: widget.controller,),
            // All(controller: widget.controller,isAfter:widget.isAfter),
          ],
        ),
      ),
    );
  }
}
