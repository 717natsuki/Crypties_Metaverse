
import 'package:crypties_app/Presentation/Screen/Timeline/View/following.dart';
import 'package:crypties_app/exports.dart';
import 'dart:ui' as ui;

import 'all.dart';

class Timeline extends StatefulWidget {
  final controller, isAfter;
  Timeline({this.controller, this.isAfter});

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
            heroTag: "hero2",
            child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: GradientConst.themeGradientLine
                ),
                child: Icon(FontAwesomeIcons.pen, size: 20,)),

            // backgroundColor: Color(0xff7597FD),
          onPressed: (){
            HapticFeedback.selectionClick();

            Navigator.of(context).push(navigateNewPost()
            );
          },
        ),
        backgroundColor: Colors.white,
        appBar:tabsAppbar('Crypties',  "All",  'Following'),
        body: TabBarView(
          children: [
            All(),
            Following()
            // Following(controller: widget.controller,),
            // All(controller: widget.controller,isAfter:widget.isAfter),
          ],
        ),
      ),
    );
  }
}


Widget tabsAppbar(title, fTitle, sTitle){
  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: AppBar(
      backgroundColor: Colors.white,
      title:appbarTitile(title,),
      elevation: 1,
      bottom: TabBar(
          labelPadding: EdgeInsets.only(bottom: 5,right: 32,left: 32),
          indicatorColor:  ColorsConst.themeColor,
          indicatorWeight: 1.5,
          unselectedLabelColor: Colors.grey[400],
          labelColor:ColorsConst.themeColor,
          tabs: [
            Text(
              fTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,fontFamily: FontConst.fontBoldFamily),
            ),
            Text(
              sTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,fontFamily: FontConst.fontBoldFamily),
            )
          ]),
    ),
  );
}