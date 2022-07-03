import 'package:crypties_app/exports.dart';

void bannedUser(context, {bannedUntil}){
  if (bannedUntil == null){
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: Color(0xff757575),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                title: Text("This user is banned",style: TextStyle(fontSize: 18),),
                content: Column(
                  children: [
                    GestureDetector(
                      child: Text('Touble?',
                        style: TextStyle(color: Colors.grey,
                            fontSize: 12),),
                      onTap: (){
                        // whenTrouble(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: Color(0xff757575),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              AlertDialog(
                title: Text("アカウント制限中",style: TextStyle(fontSize: 18),),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('このユーザは規約に違反したため、アカウントを制限しています。${bannedUntil.year}年${bannedUntil.month}月${bannedUntil.day}日${bannedUntil.hour}時までご利用できません。また、次はアカウントが永久に凍結するので気をつけてください。',style: TextStyle(color: Colors.black87,
                        fontSize: 13),),
                    SizedBox(height: 16,),

                    GestureDetector(
                      child: Text('トラブルが発生した場合',
                        style: TextStyle(color: Colors.grey,
                            fontSize: 12),),
                      onTap: (){
                        // whenTrouble(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}