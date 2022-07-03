import 'package:crypties_app/Model/User/createBlock.dart';
import 'package:crypties_app/exports.dart';

Widget profileAppbar(context, isMe, nickname, accessed, isVerified, accessedUser){
  return
    AppBar(
      centerTitle: accessed ? true : false,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    backgroundColor: Colors.white,

    title:

      accessed ?
      Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text('|',style: TextStyle(color: Colors.black),)
          Flexible(child: Text('@'+nickname, style: ThemeTextConst.appBarAccessName,)),
          isVerified ?
          SizedBox(width: 4,) : SizedBox(),
          isVerified ?
          Icon(Icons.verified, color: Colors.blue,) : SizedBox(),

        ],
      )
    :
    Row(
      children: [
        Flexible(child: appbarTitileProfile(nickname, accessed)),
        SizedBox(width: 8,),

        isVerified ?

        Icon(Icons.verified, color: Colors.blue,) : SizedBox(),

        // Expanded(child: Container())
      ],
    ),
    elevation: 0,
    actions: [
      !isMe ? TextButton(
          onPressed: ()async{

            HapticFeedback
                .selectionClick();
            bool result =
                await showModalBottomSheet<
                bool>(
              context: context,
              builder: (BuildContext
              context) {
                return StatefulBuilder(
                    builder:
                        (BuildContext
                    context,
                        setState) {
                      return Column(
                        mainAxisSize:
                        MainAxisSize
                            .min,
                        children: <
                            Widget>[
                          ListTile(
                            title: Text('Report this user', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                            onTap: ()async{
                              bool isOk = await okCancelAlert('Report this user?','Are you sure you want to report this user?', 'Report', 'Cancel', true, context);

                            },
                          ),
                          ListTile(
                            title: Text('Block this user', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: ColorsConst.red),),
                            onTap: ()async{
                              bool isOk = await okCancelAlert('Block this user?','Are you sure you want to block this user?', 'Block', 'Cancel', true, context);
                              if(isOk){
                                createBlock(FirebaseAuth.instance.currentUser.uid, accessedUser);
                                setState(() {
                                  // deleted = true;
                                });

                              }

                            },
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    });
              },
            );
          },
          child: Icon(Icons.more_horiz)) :
      TextButton(
          onPressed: (){
            HapticFeedback.selectionClick();

            Navigator.pushNamed(context, kNavigatorString.settings);
          },
          child: Container(
              width: 50,
              height: 50,
              child: Icon(Icons.settings, color: Colors.black,))),
      SizedBox(width: 8,)
    ],
  );
}